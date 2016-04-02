class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.string :first_letter, null: false
      t.string :last_letter, null: false
    end
  end
end
