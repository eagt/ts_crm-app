
class UpdateDelete < ActiveRecord::Base


	belongs_to :company
	
	belongs_to :branch

	belongs_to :professional

	belongs_to :client

	belongs_to :client_professional

	belongs_to :branch_professional

	belongs_to :contact_detail

	belongs_to :company_appointment

	belongs_to :professional_appointment

	belongs_to :employment
	
end





