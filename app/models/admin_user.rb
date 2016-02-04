class AdminUser < ActiveRecord::Base


has_secure_password

# To configure a different table name, specially if I'm working with legacy 
# databases that may not be named according to the rails conventions. orking 
# with inheritance table names. So it would be

# self.table_name = 'admin_users'

has_and_belongs_to_many :pages
has_many :edit_sections
has_many :sections, :through => :edit_sections

EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i

FORBIDDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']


#validates_presence_of :first_name
#validates_length_of :first_name, :maximum => 25

#validates_presence_of :last_name
#validates_length_of :last_name, :maximum => 50

#validates_presence_of :username
#validates_length_of :username, :within => 8..25
#validates_uniqueness_of :username

#validates_presence_of :email
#validates_length_of :email, :maximum => 100
#validates_format_of :email, :with => EMAIL_REGEX
#validates_confirmation_of :email



# SHORTCUT VALIDATIONS - SEXY VALIDATION
 
 validates :first_name, :presence => true,
 						:length => { :maximum => 25 }

 validates :last_name, :presence => true,
 						:length => { :maximum => 50 }

 validates :username,   :presence => true,
 						:length => { :within => 8..25 },
 						:uniqueness => true

 validates :email, :presence => true,
 			   	   :length => { :maximum => 100 },
 			   	   :format => EMAIL_REGEX,
 			   	   :confirmation => true


validate :username_is_allowed
# validate :no_new_users_on_saturday, :on => :create ... this was smething used 
# during practice



# The scope show below is used to sort out as required in the test. 
#Last then First. I didn't have to disambiguate the tables here by actually 
#typing in adminusers dot #in front of each one of these columns Because right now, 
#there's only one thing in my #application called last_name, so it's not ambiguous. 
#But if it was ambiguous, like it was with position, we would want to disambiguate those.

scope :sorted, lambda { order ("last_name ASC, first_name ASC")}



# Below I can see part of the answer for the test in Chapter 15
# Any of the three ways shown can be use to show First and Last_name with an space betweenn them
def name   
    "#{first_name} #{last_name}"

    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  end

def username_is_allowed
	if FORBIDDEN_USERNAMES.include?(username)
		errors.add(:username, "has been restricted from use.")
	end	
end

# Errors not related to a specific attribute
# can be added to errors [:base]

def no_new_users_on_saturday
	if Time.now.wday == 6
	   errors[:base] << " No new users on Saturdays."
	end 
end



end
