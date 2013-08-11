require 'spec_helper'

describe SessionsController do
  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end

    it "renders the new template" do
      get :new
      response.should render_template('sessions/new')
    end
  end

  describe "POST 'create'" do
    let(:user) { FactoryGirl.create(:user) }

    it "returns http redirect" do
      post :create, :session => {:username => user.username,
                                 :password => user.password}

      response.should be_redirect
    end

    it "finds the user regardless of case" do
      post :create, :session => {:username => user.username.upcase,
                                 :password => user.password}
      response.should redirect_to(root_path)
    end

    it "renders the new template for invalid data" do
      post :create, :session => {:username => '', :password => ''}
      response.should render_template('sessions/new')
    end

    it "redirects to the track index for valid data" do
      post :create, :session => {:username => user.username,
                                 :password => user.password}
      response.should redirect_to(root_path)
    end
  end

  describe "DELETE 'destroy'" do
    let(:user) { FactoryGirl.create(:user) }
    before { sign_in_as user }

    it "returns http redirect" do
      delete :destroy
      response.should be_redirect
    end

    it "redirects to the track index" do
      delete :destroy
      response.should redirect_to(root_path)
    end
  end

end
