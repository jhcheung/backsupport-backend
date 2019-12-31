class Api::V1::TicketsController < ApplicationController

    def index
        tickets = Ticket.all

        render json: { tickets: TicketSerializer.new(tickets) }
    end

    def create
        ticket = Ticket.create(ticket_params)
        if ticket.valid?
          render json: { ticket: TicketSerializer.new(ticket) }, status: :created
        else
          render json: { error: 'Failed to create ticket' }, status: :not_acceptable
        end

    end

    private
    def ticket_params
        params.require(:ticket).permit(:title, :customer_id, :owner_id, :open)

    end
end
