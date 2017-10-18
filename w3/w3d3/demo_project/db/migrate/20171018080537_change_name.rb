class ChangeName < ActiveRecord::Migration[5.1]
  def change
    rename_table :house, :houses
    rename_table :person, :people
  end
end
