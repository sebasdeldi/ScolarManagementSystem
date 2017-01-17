class AddTeacherIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :teacher_id, :integer
  end
end
