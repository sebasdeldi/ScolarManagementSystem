class AddStudentIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :student_id, :integer
  end
end
