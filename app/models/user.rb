class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :private_message
  has_many :comments
  has_many :comments_comments
  has_many :like
end
