class ProfessionalsController < ApplicationController

  layout "professional"

  before_action :set_locale


  def index

    @professionals = Professional.sorted_lastname

  end


  def show

    @professional = Professional.find(params[:id])

  end


  def new

     @professional = Professional.new({:first_name => " "})
     @professional_count = Professional.count + 1

  end

  def create

    #Instantiate the new object using the form parameters
    @professional  = Professional.new(professional_params)
# Save the object
   
    if @professional.save
# If the save succeed, it will redirect some where (this case, index action)
    flash[:notice] = " Professional '#{@professional.first_name}' created successfully!"
    redirect_to(:action => 'index')
    
    else 
# If the save fails, redisplay the form so the user can fix the problem and the submit it
     @professional_count = Professional.count + 1
    render('new')
  end
end 


  def edit

     @professional = Professional.find(params[:id])

  end


  def update

     #Find an existing object using the form parameters
      @professional = Professional.find(params[:id])
     
      # Update the object

     if @professional.update_attributes(professional_params)
      flash[:notice] = " Professional '#{@professional.first_name}'' updated successfully!"
      # If the update succeed, it will redirect some where (this case, index action)
      redirect_to(:action => 'show', :id => @professional.id)
      
      else 
      # If the update fails, redisplay the form so the user can fix the problem and the submit it
       @professional_count = Professional.count + 1
       render('edit')
       end

  end

  def delete

     @professional = Professional.find(params[:id])

  end

  def destroy

  #I Find an existing object using the form parameters
    professional = Professional.find(params[:id]).destroy 
    flash[:notice] = " Professional '#{professional.first_name}' destroyed successfully!"
    redirect_to(:action => 'index')

  end


  private

   def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

  def professional_params
    # same as using "params[:subject]", except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
    params.require(:professional).permit(:id_code, :first_name, :last_name, :dob, :email, :specialty, 
      :pass_active, :acc_active, :pasword_digest, :last_in)
  end


end
