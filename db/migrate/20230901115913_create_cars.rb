class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars, id: :uuid do |t|
      t.string :title
      t.string :engine_number
      t.string :registration_no

      t.timestamps
    end
  end
end
