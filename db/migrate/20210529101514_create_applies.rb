class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.text :my_url
      t.date :expiracy_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
