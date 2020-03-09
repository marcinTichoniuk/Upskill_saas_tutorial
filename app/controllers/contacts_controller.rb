class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
    # new blank object assign to variable @contact
    # {name: '', email: '', comments: ''}
  end

  # by default saving object to db
  # when someone click 'Submit' button invoke function create
  def create
    @contact = Contact.new(contact_params)
    # new object assign to variable (invoke contact_params method which is down below)
    # {name: 'what_someone_input_here', email: 'what_someone_input_here', comments: 'what_someone_input_here' }
    # save to database
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # from app/mailers/contact_mailer.rb -> def contact_email()
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message sent ddd"
      # assign to object flash key success (if flash doesn't have one it creates new key) value "Message sent ddd"
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
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
  
end