class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :index, :new]
  def index
    @tickets = @user.tickets.all
  end

  def show
  end

  def new
    @ticket = @user.tickets.new
    @train = Train.find(params[:train_id])
  end

  def create
    @ticket = @user.tickets.new(ticket_params)
    @train = Train.find(params[:train_id])
    @ticket.train = @train

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to user_tickets_path(@ticket.user)
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def ticket_params
    params.require(:ticket).permit(:passenger_name, :train_id)
  end
end