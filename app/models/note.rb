class Note < ActiveRecord::Base
	belongs_to :student, class_name: 'User'
	belongs_to :teacher, class_name: 'User'

	def self.search_note_by_subject(search)
	  where("subject LIKE ?", "%#{search}%")
	end

end
