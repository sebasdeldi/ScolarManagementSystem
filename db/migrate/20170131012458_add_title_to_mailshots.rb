class AddTitleToMailshots < ActiveRecord::Migration
  def change
    add_column :mailshots, :title, :string
  end
end
