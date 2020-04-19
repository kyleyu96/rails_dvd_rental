class AdminSessionsController < ApplicationController

  before_action :not_admin, only: [:new, :create]

  def new
  end

  def create
    if params[:admin_session][:password] == 'password123'
      session[:admin] = 'true'
      cookies.encrypted[:admin] = 'true'
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid password.'
      render 'new'
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path
  end

  private

  def not_admin
    if admin?
      flash[:danger] = 'You have already signed in.'
      redirect_to root_path
    end
  end

end