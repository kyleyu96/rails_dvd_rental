class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :summary
      t.string :poster_url
      t.integer :max_quantity
      t.integer :current_inventory
      t.timestamps
    end
  end
end
