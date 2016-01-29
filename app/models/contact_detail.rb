
class ContactDetail < ActiveRecord::Base


	belongs_to :company
	belongs_to :branch
	belongs_to :professional
	belongs_to :client
	has_many :update_deletes
	
end