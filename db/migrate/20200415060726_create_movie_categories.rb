class CreateMovieCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_categories do |t|
      t.belongs_to :movie
      t.belongs_to :category
    end
  end
end
