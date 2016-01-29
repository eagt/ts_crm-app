class ProfessionalAppointment < ActiveRecord::Base

	belongs_to :company
	belongs_to :branch
	belongs_to :professional
	belongs_to :client
	
	has_one :company_appointment

	has_many :update_deletes

end