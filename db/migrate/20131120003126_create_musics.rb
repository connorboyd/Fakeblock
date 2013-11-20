class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.integer :user_id
      t.string :artists

      t.timestamps
    end
  end
end
