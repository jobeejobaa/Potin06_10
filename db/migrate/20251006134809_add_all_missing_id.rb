class AddAllMissingId < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :user, foreign_key: true
    add_reference :comments, :gossip, foreign_key: true
    add_reference :gossip_tags, :tag, foreign_key: true
    add_reference :gossip_tags, :gossip, foreign_key: true
    add_reference :likes, :gossip, foreign_key: true
    add_reference :likes, :user, foreign_key: true
  end
end
