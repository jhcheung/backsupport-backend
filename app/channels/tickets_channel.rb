class TicketsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "tickets_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
