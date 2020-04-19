class RentalsController < ApplicationController

  before_action :require_admin

  def index
    @rentals = Rental.paginate(page: params[:page], per_page: 20)
  end

  def new
    @available_movies = Movie.all.select{ |m| m.current_inventory > 0 }
      .sort_by{ |m| m[:title] }
  end

  def create
    if params[:customer_id].blank?
      flash[:danger] = 'Select a customer.'
      redirect_to new_rental_path
    else
      customer = Customer.find(params[:customer_id])
      params[:movie_ids].each do |m_id|
        next if m_id.blank?
        movie = Movie.find(m_id)
        new_rental = Rental.new(customer: customer, movie: movie)
        new_rental.save
        movie.update(current_inventory: movie.current_inventory - 1)
      end
      redirect_to customer_path(customer)
    end
  end

end