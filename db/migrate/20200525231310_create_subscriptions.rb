class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.boolean :is_active
      t.boolean :is_monday
      t.boolean :is_tuesday
      t.boolean :is_wednesday
      t.boolean :is_thursday
      t.boolean :is_friday
      t.boolean :is_saturday
      t.integer :order_index
      t.references :newspaper, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
