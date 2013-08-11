require 'spec_helper'

describe Track do
  let(:track) { FactoryGirl.build(:track) }

  subject { track }

  it { should be_valid }

  describe "when title is not present" do
    before { track.title = "" }
    it { should_not be_valid }
  end

  describe "when artist is not present" do
    before { track.artist = "" }
    it { should_not be_valid }
  end

  describe "when midi_file is not present" do
    let(:track) do
      Track.new(FactoryGirl.attributes_for(:track, :midi_file => nil))
    end
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { track.user = nil }
    it { should_not be_valid }
  end

  describe "searching for an artist" do
    let!(:other_track) { FactoryGirl.create(:track, :artist => 'Prince') }

    specify { Track.like('Prince').should include(other_track) }
    specify { Track.like('prince').should include(other_track) }
    specify { Track.like('hey').should_not include(other_track) }
  end

  describe "searching for a title" do
    let!(:other_track) { FactoryGirl.create(:track, :title => 'Hey ya') }

    specify { Track.like('ya').should include(other_track) }
    specify { Track.like('HEY').should include(other_track) }
    specify { Track.like('1999').should_not include(other_track) }
  end
end
