class Person < ActiveRecord::Migration[5.1]
  def change
    create_table :person do |t|
      t.string :name, null: false
      t.integer :house_id, null: false
      t.timestamps
    end
  end
end
