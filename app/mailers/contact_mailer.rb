class ContactMailer < ActionMailer::Base

  default to: 'marcinxdar@wp.pl'

  # name, email, body from app/controllers/contacts_controller.rb -> def create (name, email, comments) -> save these 3 pieces of information to database 
  # get name, email, body (aka comments) from database
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'Contact Form Message')
  end

end