require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:user_attrs) { FactoryGirl.attributes_for(:user) }

  subject { response }

  describe "GET 'new'" do
    before { get :new }

    it { should be_success }
    it { should render_template('users/new') }
  end

  describe "POST 'create'" do
    describe "with valid data" do
      context do
        before { post :create, :user => user_attrs }

        it { should be_redirect }
        it { should redirect_to(root_path) }
      end

      it "creates a user" do
        expect { post :create, :user => user_attrs }.to change {User.count}.by(1)
      end
    end

    describe "with invalid data" do
      context do
        before { post :create, :user => {} }

        it { should be_success }
        it { should render_template('users/new') }
      end

      it "does not create a user" do
        expect { post :create, :user => {} }.to_not change {User.count}
      end
    end
  end

  describe "GET 'show'" do
    before { get :show, :id => user }

    it { should be_success }
    it { should render_template('users/show') }

    it "assigns the user to @user" do
      assigns(:user).should eq(user)
    end
  end

  describe "GET 'index'" do
    before do
      user.save!
      get :index
    end

    it { should be_success }
    it { should render_template('users/index') }

    it "populates an array of users in @users" do
      assigns(:users).should eq([user])
    end
  end

  describe "GET 'edit'" do
    before do
      sign_in_as user
      get :edit, :id => user
    end

    it { should be_success }
    it { should render_template('users/edit') }
  end

  describe "PUT 'update'" do
    before do
      sign_in_as user
      put :update, :id => user, :user => user_attrs
    end

    it { should be_redirect }
    it { should redirect_to(root_path) }

    it "locates the requested user" do
      assigns(:user).should eq(user)
    end

    it "changes the user's attributes" do
      user.reload
      user_attrs.each { |attr, val| user.send(attr).should eq(val) }
    end
  end

end
