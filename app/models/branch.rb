
class Branch < ActiveRecord::Base

	has_and_belongs_to_many :professionals

	has_many :contact_details
	belongs_to :company
	has_many :clients
	has_many :appointments
	
	has_many :update_deletes


end
