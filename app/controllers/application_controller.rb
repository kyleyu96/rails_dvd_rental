class ApplicationController < ActionController::Base

  helper_method :customer?, :admin?

  def customer?
    !!session[:customer_id]
  end

  def admin?
    !!session[:admin]
  end

  def require_admin
    if !admin?
      flash[:danger] = 'Unauthorized action.'
      redirect_to root_path
    end
  end

end
