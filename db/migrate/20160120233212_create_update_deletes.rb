class CreateUpdateDeletes < ActiveRecord::Migration
  

  def up
    create_table :update_deletes do |t|

    	t.integer "company_id"
    	t.integer "branch_id"
    	t.integer "professional_id"
    	t.integer "client_id"
    	t.integer "contact_details_id" 

      t.integer "employment_id"       
      t.integer "appointments_id"  
      t.integer "professional_appointments_id"   
      t.integer "update_deletes_id" 
     

    # These would be all the details that are going to be pull out 
    # from the database and be recorded on this tbale. The first_name and
    # last_name will be pull out from the user's login

      	t.string "first_name"
        t.string "last_name"
        t.string "table_name"
      	t.string "column_name"
      	t.string "element"
      	t.string "Action_taken"    	
        t.text   "reason"
        t.string "new_element"


        t.timestamps null: false
    end

    	add_index("update_deletes", "company_id")
     	add_index("update_deletes", "branch_id")
     	add_index("update_deletes", "professional_id")
     	add_index("update_deletes", "client_id")

     	add_index("update_deletes", "contact_details_id")
      add_index("update_deletes", "employment_id")
      add_index("update_deletes", "appointments_id")
      
      add_index("update_deletes", "update_deletes_id")
   

  end

  	def down
    drop_table :update_deletes 

    #t.timestamps null: false
    end

end