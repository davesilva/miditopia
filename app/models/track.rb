class Track < ActiveRecord::Base
  attr_accessible :artist, :title, :midi_file
  mount_uploader :midi_file, TrackUploader
  process_in_background :midi_file

  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :artist, :presence => true
  validates :title, :presence => true
  validates :midi_file, :presence => true
  validates :user, :presence => true

  default_scope order('created_at DESC')
  scope :processed, where(:midi_file_processing => nil)
  scope :processing, where(:midi_file_processing => true)
  scope :like, lambda { |query|
    where("title ILIKE ? OR artist ILIKE ?", "%#{query}%", "%#{query}%")
  }
end
