class AddUserRelationToResults < ActiveRecord::Migration
  def change
    add_column :results, :user_id, :integer, null: false
  end
end
