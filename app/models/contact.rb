class Contact < ActiveRecord::Base
  
  # Contact form validation
  # :name, :email, :comments from app/db/schema.rb -> create_table "contacts"
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true

end