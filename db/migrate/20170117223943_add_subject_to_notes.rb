class AddSubjectToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :subject, :string
  end
end
