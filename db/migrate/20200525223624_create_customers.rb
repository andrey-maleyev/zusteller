class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :delivery_note
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
