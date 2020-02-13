class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    ticket = Ticket.find(params[:ticket])
    # stream_from "messages_channel"
    stream_for ticket
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
