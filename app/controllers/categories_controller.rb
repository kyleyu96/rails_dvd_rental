class CategoriesController < ApplicationController

  before_action :find_category, except: [:new, :create]
  before_action :require_admin, except: [:show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created.'
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category updated.'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    @movies = @category.movies.paginate(page: params[:page], per_page: 20)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end