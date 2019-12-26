class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_many :tickets, foreign_key: :customer_id, class_name: 'Ticket'
    has_many :owners, through: :tickets

    has_many :owned_tickets, foreign_key: :owner_id, class_name: 'Ticket'
    has_many :customers, through: :owned_tickets, source: :user
  
end
