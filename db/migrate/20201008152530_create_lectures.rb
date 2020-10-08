class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :title
      t.date :day
      t.integer :number
      t.integer :schedule
      t.string :room
      t.integer :password
      t.string :comment

      t.timestamps
    end
  end
end
