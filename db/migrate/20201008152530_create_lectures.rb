class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :room
      t.string :comment

      t.timestamps
    end
  end
end
