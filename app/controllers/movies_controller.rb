class MoviesController < ApplicationController

  before_action :find_movie, only: [:edit, :update, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @movies = Movie.paginate(page: params[:page], per_page: 20)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.current_inventory = @movie.max_quantity
    if @movie.save
      flash[:success] = 'Movie created.'
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = 'Movie updated.'
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def movie_params
    params.require(:movie)
      .permit(:title, :year, :summary, :poster_url, :max_quantity, category_ids: [])
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end