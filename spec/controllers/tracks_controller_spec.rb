require 'spec_helper'

describe TracksController do
  subject { response }

  describe "GET 'index'" do
    before { get :index }

    it { should be_success }
    it { should render_template('tracks/index') }
  end

  describe "GET 'index' with a filter query" do
    let!(:matching) { FactoryGirl.create(:track, :artist => 'Prince') }
    let!(:not_matching) { FactoryGirl.create(:track, :artist => 'MJ') }
    before { get :index, :query => 'Prince' }

    it { should be_success }
    it { should render_template('tracks/index') }
  end
end
