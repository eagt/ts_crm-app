class Employment < ActiveRecord::Base

	belongs_to :professional
	belongs_to :company
	has_many :update_deletes
end
