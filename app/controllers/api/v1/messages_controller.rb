class Api::V1::MessagesController < ApplicationController

    def index
      messages = Message.all

      render json: MessageSerializer.new(messages).serialized_json

    end
    def create
        message = Message.create(message_params)
        options = {
            include: [:ticket, :user]
        }        
        if message.valid?
          render json: MessageSerializer.new(message, options).serialized_json, status: :created
        else
          render json: { error: 'Failed to create message' }, status: :not_acceptable
        end

    end

    private
    def message_params
        params.require(:message).permit(:content, :ticket_id, :user_id)
    end

end
