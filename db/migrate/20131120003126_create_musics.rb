class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.int :user_id
      t.string :artists

      t.timestamps
    end
  end
end
