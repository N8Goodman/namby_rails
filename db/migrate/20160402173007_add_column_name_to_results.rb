class AddColumnNameToResults < ActiveRecord::Migration
  def change
    add_column :results, :name, :string
  end
end
