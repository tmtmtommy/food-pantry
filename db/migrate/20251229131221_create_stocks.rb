class CreateStocks < ActiveRecord::Migration[8.1]
  def change
    create_table :stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vegetable, foreign_key: true
      t.string :custom_name
      t.date :purchased_on

      t.timestamps
    end
  end
end
