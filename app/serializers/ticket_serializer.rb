class TicketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :open
  belongs_to :customer, record_type: :user, serializer: UserSerializer
  belongs_to :owner, record_type: :user, serializer: UserSerializer
  has_many :messages
end
