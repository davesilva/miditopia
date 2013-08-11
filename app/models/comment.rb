class Comment < ActiveRecord::Base
  attr_accessible :body

  belongs_to :user
  belongs_to :track

  validates :body, :presence => true
  validates :user, :presence => true
  validates :track, :presence => true
end
