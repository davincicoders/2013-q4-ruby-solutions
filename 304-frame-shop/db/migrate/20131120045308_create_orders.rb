class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :material_id
      t.integer :num_linear_inches
      t.boolean :include_hanging_hardware
      t.float   :total_price
      t.timestamps
    end
  end
end
