class CommentsController < ApplicationController
  before_filter :signed_in_user, :only => [:create]
  before_filter :correct_user, :only => [:destroy]

  def create
    @track = Track.find(params[:track_id])
    @comment = @track.comments.new(params[:comment])
    @comment.user = current_user

    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:success] = "Comment deleted."
    redirect_to root_path
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:success] = "Comment updated."
      redirect_to root_path
    else
      render 'edit'
    end
  end

private

  def correct_user
    return if current_user_admin?

    @comment = Comment.find(params[:id])
    redirect_to root_path unless current_user?(@comment.user)
  end

end
