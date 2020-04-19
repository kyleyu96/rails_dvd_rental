class SessionsController < ApplicationController

  def new
    if customer?
      @customer = Customer.find(session[:customer_id])
    end
  end

  def create
    customer = Customer.find_by(email: params[:session][:email])
    if customer
      session[:customer_id] = customer.id
      cookies.encrypted[:customer_id] = customer.id
      redirect_to profile_path
    else
      flash.now[:danger] = 'Invalid email.'
      render 'new'
    end
  end

  def destroy
    session[:customer_id] = nil
    redirect_to profile_path
  end

end