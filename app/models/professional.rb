class Professional < ActiveRecord::Base

	has_and_belongs_to_many :branches
	has_many :contact_details

	has_many :appintments

	has_and_belongs_to_many :clients
	has_many :employments
	has_many :companies, :through => :employments
	
	has_many :update_deletes

	validates_presence_of :first_name

	scope :sorted_name, lambda { order("professionals.first_name ASC")}
	scope :sorted_lastname, lambda { order("professionals.last_name ASC")}
  	scope :newest_first, lambda { order("professionals.created_at DESC")}
  	scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])}
	
end
