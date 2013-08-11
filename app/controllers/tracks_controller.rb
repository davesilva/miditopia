class TracksController < ApplicationController
  before_filter :signed_in_user, :only => [:new, :create, :destroy, :edit, :update]
  before_filter :correct_user, :only => [:destroy, :edit, :update]

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    @track.user = current_user

    if @track.save
      flash[:success] = "Upload successful! The new track will\
                         appear when it is done processing."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(params[:track])
      flash[:success] = "Track updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def index
    @tracks = Track.processed
    if params[:query].present?
      @tracks = @tracks.like(params[:query])
    end

    @tracks = @tracks.paginate(:page => params[:page], :per_page => 5)
  end

  def destroy
    Track.find(params[:id]).destroy
    flash[:success] = "Track deleted."
    redirect_to root_path
  end

private

  def correct_user
    return if current_user_admin?

    @track = Track.find(params[:id])
    redirect_to root_path unless current_user?(@track.user)
  end

end
