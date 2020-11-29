class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :image
      t.string :introduction
      t.string :sns
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
