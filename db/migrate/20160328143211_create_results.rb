class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :gender, null: false
      t.integer :count, null: false
      t.string :starts_with
      t.string :ends_with

      t.timestamps
    end
  end
end
