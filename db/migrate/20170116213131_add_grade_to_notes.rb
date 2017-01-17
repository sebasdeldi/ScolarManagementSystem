class AddGradeToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :grade, :integer
  end
end
