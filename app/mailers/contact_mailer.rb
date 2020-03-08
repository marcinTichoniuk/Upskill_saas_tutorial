class ContactMailer < ActionMailer::Base

  default to: 'marcinxdar@wp.pl'

  # name, email, body from app/controllers/contacts_controller.rb -> def create (name, email, comments)
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'Contact Form Message')
  end

end