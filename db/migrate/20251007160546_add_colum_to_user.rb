class AddColumToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :active_user, :boolean, default: false
  end
end
