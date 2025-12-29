class CreateVegetables < ActiveRecord::Migration[8.1]
  def change
    create_table :vegetables do |t|
      t.string :name

      t.timestamps
    end
  end
end
