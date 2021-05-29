class CreateRentfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :rentfiles do |t|
      t.boolean :required
      t.string :name
      t.references :apply, null: false, foreign_key: true

      t.timestamps
    end
  end
end
