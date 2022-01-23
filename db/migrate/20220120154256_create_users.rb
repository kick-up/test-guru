class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name

      t.timestamps
    end
    change_column_null :users, :name, false
  end
end
