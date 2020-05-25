class CreateNewspapers < ActiveRecord::Migration[5.2]
  def change
    create_table :newspapers do |t|
      t.string :name
      t.string :full_name

      t.timestamps
    end
  end
end
