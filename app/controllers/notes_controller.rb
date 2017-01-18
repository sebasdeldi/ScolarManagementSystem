class NotesController < ApplicationController
	def create
		note = Note.new(note_params)
		note.student_id = params[:student_id]
		note.teacher_id = params[:teacher_id]
		note.save

		redirect_to :back
	end


	private
		def note_params
			params.require(:note).permit(:description, :grade, :subject, :student_id, :teacher_id)
		end
end
