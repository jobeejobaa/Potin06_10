class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments
  has_many :likes
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags

  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true

end
