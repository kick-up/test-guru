class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.text :title

      t.timestamps
    end
    change_column_null :categories, :title, false
  end
end
