class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.int :user_id
      t.string :movie_names

      t.timestamps
    end
  end
end
