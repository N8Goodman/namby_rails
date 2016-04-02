class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user, null: false
      t.belongs_to :kid, null: false
    end
  end
end
