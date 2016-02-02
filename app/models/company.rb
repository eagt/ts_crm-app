
class Company < ActiveRecord::Base

	has_many :contact_details
	has_many :branches
	has_many :clients
	has_many :appointments
	has_many :employments
	has_many :professionals, :through => :employments
	
	has_many :update_deletes
	
end
