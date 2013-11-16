class InitialSchema < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string  :color
      t.string  :model
      t.integer :member_id
    end
    create_table :members do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
