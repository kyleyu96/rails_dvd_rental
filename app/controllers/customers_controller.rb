class CustomersController < ApplicationController

  before_action :find_customer, only: [:edit, :update, :show]
  before_action :require_admin

  def index
    @customers = Customer.paginate(page: params[:page], per_page: 20)
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = 'Customer created.'
      redirect_to customer_path(@customer)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = 'Customer updated.'
      redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :email)
  end

  def find_customer
    @customer = Customer.find(params[:id])
  end

end