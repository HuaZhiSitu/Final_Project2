class CreateSkins < ActiveRecord::Migration[7.1]
  def change
    create_table :skins do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :starting_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
