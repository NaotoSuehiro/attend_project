class AddImageToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :image, :string
  end
end
