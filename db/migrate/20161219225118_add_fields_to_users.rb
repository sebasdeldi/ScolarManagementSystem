class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :names, :string
  	add_column :users, :last_names, :string
  	add_column :users, :guardian, :string
  	add_column :users, :phone, :string
  end
end
