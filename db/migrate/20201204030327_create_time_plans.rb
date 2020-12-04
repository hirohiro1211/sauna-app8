class CreateTimePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :time_plans do |t|

      t.timestamps
    end
  end
end
