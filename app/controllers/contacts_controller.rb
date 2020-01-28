class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    # new blank object assign to variable @contact
    # {name: '', email: '', comments: ''}
  end

  # by default saving object to db
  def create
    @contact = Contact.new(contact_params)
    # new object assign to variable (invoke contact_params method which is down below)
    # {name: 'what_someone_input_here', email: 'what_someone_input_here', comments: 'what_someone_input_here' }
    if @contact.save
      flash[:success] = "Message sent"
      redirect_to new_contact_path
    else
      flash[:error] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  # private - security feature, save object with security to db
  # private methods can be used only inside this class
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
  
end