require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  subject { user }

  it { should be_valid }

  describe "when email is not present" do
    before { user.email = "" }
    it { should_not be_valid }
  end

  describe "when username is not present" do
    before { user.username = "" }
    it { should_not be_valid }
  end

  describe "when email is not unique" do
    before do
      user2 = user.dup
      user2.username = "Forrest"
      user2.email = user2.email.upcase
      user2.save!
    end

    it { should_not be_valid }
  end

  describe "when username is not unique" do
    before do
      user2 = user.dup
      user2.email = "forrest@forrestbice.com"
      user2.username = user2.username.upcase
      user2.save!
    end

    it { should_not be_valid }
  end

  shared_examples_for "a password" do
    describe "when password doesn't match confirmation" do
      before { user.password = "scott321" }
      it { should_not be_valid }
    end

    describe "when password is too short" do
      before { user.password = user.password_confirmation = "aaa" }
      it { should_not be_valid }
    end
  end

  describe "when password_digest is not present" do
    before { user.password_digest = "" }

    it { should_not be_valid }
    it_should_behave_like "a password"

    describe "and password is not present" do
      before { user.password = user.password_confirmation = "" }
      it { should_not be_valid }
    end

    describe "and password confirmation is nil" do
      before { user.password_confirmation = nil }
      it { should_not be_valid }
    end
  end

  describe "when password_digest is present" do
    it_should_behave_like "a password"

    describe "and password is not present" do
      before { user.password = user.password_confirmation = "" }
      it { should be_valid }
    end
  end

  describe "#authenticate" do
    before { user.save! }
    let(:found_user) { User.find_by_email(user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(user.password) }
    end

    describe "with invalid password" do
      let(:invalid_password_user) { found_user.authenticate("nathan312") }

      it { should_not == invalid_password_user }
      specify { invalid_password_user.should be_false }
    end
  end

  describe "remember token" do
    before { user.save! }
    its(:remember_token) { should_not be_blank }
  end

  describe "login_name" do
    before { user.save! }
    its(:login_name) { should_not be_blank }
  end

end
