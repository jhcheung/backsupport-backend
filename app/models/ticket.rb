class Ticket < ApplicationRecord
    belongs_to :customer, class_name: 'User', foreign_key: 'customer_id'
    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

    has_many :messages
    has_many :users, through: :messages
end
