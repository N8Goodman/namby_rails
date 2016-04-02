class AddUniqueness < ActiveRecord::Migration
  def change
    add_index :kids, [:name, :gender], unique: true, using: :btree
    add_index :kids, :first_letter, using: :btree
    add_index :kids, :last_letter, using: :btree
  end
end
