class CreateBads < ActiveRecord::Migration
  def change
    create_table :bads do |t|
      t.string :name, null: false
      t.belongs_to :result, null: false
    end
  end
end
