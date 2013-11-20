class CreateSubOrders < ActiveRecord::Migration
  def change
    create_table :sub_orders do |t|
      t.string  :sandwich_type
      t.string  :bread_type
      t.boolean :is_twelve_inch
      t.boolean :has_extra_meat
      t.boolean :has_chips
      t.float   :total_price
      t.timestamps
    end
  end
end
