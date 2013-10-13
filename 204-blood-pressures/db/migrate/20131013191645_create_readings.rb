class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :name
      t.integer :systolic
      t.integer :diastolic
    end
  end
end
