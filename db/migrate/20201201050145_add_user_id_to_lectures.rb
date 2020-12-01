class AddUserIdToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :user_id, :integer
  end
end
