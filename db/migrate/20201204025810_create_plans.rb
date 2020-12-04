class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.integer :time_plan_id
      t.date :date              
      t.references :sauna, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
