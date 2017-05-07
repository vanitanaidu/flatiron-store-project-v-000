class CreateItems < ActiveRecord::Migration

  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.integer :inventory
      t.integer :category

      t.timestamps null: false
    end
  end
end
