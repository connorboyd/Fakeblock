class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :hometown
      t.date :birthday
      t.string :school
      t.string :job
      t.string :quotes

      t.timestamps
    end
  end
end
