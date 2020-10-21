class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :lecture, foreign_key: true

      t.timestamps
      t.index [:user_id, :lecture_id], unique: true
    end
  end
end
