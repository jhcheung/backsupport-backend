class Api::V1::MessagesController < ApplicationController

    def index
      messages = Message.all

      render json: MessageSerializer.new(messages).serialized_json

    end
    def create
        message = Message.create(message_params)
        ticket = Ticket.find(message_params[:ticket_id])
        options = {
            include: [:ticket, :user]
        }        
        if message.valid?
          serialized_data = MessageSerializer.new(message, options).serialized_json
          # MessagesChannel.broadcast_to(ticket, serialized_data)
          ActionCable.server.broadcast('messages_channel', MessageSerializer.new(message, options).serializable_hash)
          render json: serialized_data, status: :created
        else
          render json: { error: 'Failed to create message' }, status: :not_acceptable
        end

    end

    private
    def message_params
        params.require(:message).permit(:content, :ticket_id, :user_id)
    end

end
