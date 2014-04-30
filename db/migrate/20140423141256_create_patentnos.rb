class CreatePatentnos < ActiveRecord::Migration
  def change
    create_table :patentnos do |t|
      t.string :patno

      t.timestamps
    end
  end
end
