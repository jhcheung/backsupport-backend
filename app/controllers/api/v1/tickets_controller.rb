class Api::V1::TicketsController < ApplicationController

    def index
        tickets = Ticket.all
        options = {
            include: [:messages, :owner, :customer]
        }        

        render json: TicketSerializer.new(tickets, options).serialized_json
    end

    def create
        ticket = Ticket.create(ticket_params)
        options = {
            include: [:messages, :owner, :customer]
        }        
        if ticket.valid?
            ActionCable.server.broadcast('tickets_channel', TicketSerializer.new(ticket, options).serializable_hash)
          render json: TicketSerializer.new(ticket, options).serialized_json, status: :created
        else
          render json: { error: 'Failed to create ticket' }, status: :not_acceptable
        end

    end

    def toggle
        ticket = Ticket.find(params[:id])

        options = {
            include: [:messages, :owner, :customer]
        }        

        ticket.open = !ticket.open
        if ticket.save
            render json: TicketSerializer.new(ticket, options).serialized_json, status: :accepted
        else
            render json: { error: 'Failed to toggle ticket' }, status: :not_acceptable
        end
    end

    def show
        ticket = Ticket.find(params[:id])
        options = {
            include: [:messages, :owner, :customer]
        }        

        render json: TicketSerializer.new(ticket, options).serialized_json
    end

    def update
        ticket = Ticket.find(params[:id])

        options = {
            include: [:messages, :owner, :customer]
        }        

        if ticket.update(ticket_params)
            render json: TicketSerializer.new(ticket, options).serialized_json, status: :accepted
        else
            render json: { error: 'Failed to update ticket' }, status: :not_acceptable
        end

    end

    private
    def ticket_params
        params.require(:ticket).permit(:title, :customer_id, :owner_id, :open)
    end
end
