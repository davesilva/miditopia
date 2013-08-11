require 'spec_helper'

describe Comment do
  let(:comment) { FactoryGirl.build(:comment) }

  subject { comment }

  it { should be_valid }

  describe "when body is not present" do
    before { comment.body = "" }
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { comment.user = nil }
    it { should_not be_valid }
  end

  describe "when track is not present" do
    before { comment.track = nil }
    it { should_not be_valid }
  end
end
