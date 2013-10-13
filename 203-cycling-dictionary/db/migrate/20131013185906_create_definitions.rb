class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :term
      t.string :part_of_speech
      t.string :meaning
    end
  end
end
