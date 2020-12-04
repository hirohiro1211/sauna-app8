class CreateSaunas < ActiveRecord::Migration[6.0]
  def change
    create_table :saunas do |t|
      t.string :name
      t.integer :sauna_deg
      t.integer :water_deg
      t.integer :price
      t.integer :time_limit
      t.text    :address
      t.text    :business_hours
      t.references :admin, foreign_key: true
      t.timestamps
    end
  end
end
