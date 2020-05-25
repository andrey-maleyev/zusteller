class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.datetime :date
      t.boolean :is_delivered
      t.references :subscription, foreign_key: true

      t.timestamps
    end
  end
end
