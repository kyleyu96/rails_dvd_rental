class ReturnsController < ApplicationController

  before_action :require_admin

  def new
  end

  def select
    if params[:customer_id].blank?
      flash[:danger] = 'Select a customer.'
      redirect_to rental_return_path
    else
      @selected_customer = params[:customer_id]
      customer = Customer.find(@selected_customer)
      @remaing_returns = customer.rentals.select{ |r| r.returned_at.blank? }
      if @remaing_returns.blank?
        flash[:danger] = 'This customer has no DVD to return.'
        redirect_to rental_return_path
      end
    end
  end

  def create
    if params[:rental_ids].blank?
      flash[:danger] = 'Select at least one DVD to return.'
      redirect_to rental_return_path
    else
      customer = Rental.find(params[:rental_ids][0]).customer
      params[:rental_ids].each do |r_id|
        rental = Rental.find(r_id)
        rental.update(returned_at: Time.now)
        rental.movie.update(current_inventory: rental.movie.current_inventory + 1)
      end
      redirect_to customer_path(customer)
    end
  end

end