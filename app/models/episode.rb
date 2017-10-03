class Episode < ApplicationRecord
  belongs_to :tv_show
  has_many :episode_ratins, :dependent => :destroy
  has_many :episode_comments, :dependent => :destroy
  has_many :users, through: :episode_ratings
end
