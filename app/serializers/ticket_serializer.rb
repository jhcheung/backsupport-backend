class TicketSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :owner_id, :customer_id, :open
end
