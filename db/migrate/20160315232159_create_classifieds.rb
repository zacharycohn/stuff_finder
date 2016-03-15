class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
