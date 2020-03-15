class ContactsController < ApplicationController
  
  # GET request to /contact-us
  # Show new contact form
  def new
    @contact = Contact.new 
    # new blank object assign to variable @contact
    # {name: '', email: '', comments: ''}
  end

  # POST request /contacts
  # by default saving object to db
  # when someone click 'Submit' button invoke function create
  def create
    # new object assign to variable (invoke contact_params method which is down below)
    # {name: 'what_someone_input_here', email: 'what_someone_input_here', comments: 'what_someone_input_here' }
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the Contact object to the database
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # from app/mailers/contact_mailer.rb -> def contact_email()
      ContactMailer.contact_email(name, email, body).deliver
      # assign to object flash key success (if flash doesn't have one it creates new key) value "Message sent ddd"
      flash[:success] = "Message sent ddd"
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      # flash -> {key: value, error: "Name can't be blank"}
      redirect_to new_contact_path
    end
  end

  # private - security feature, save object with security to db
  # private methods can be used only inside this class
  private
    # To collect data from form, we need to use strong parameters
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
  
end