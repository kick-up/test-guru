class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :body

      t.timestamps
    end
    change_column_null :questions, :body, false
    add_reference :questions, :test, foreign_key: true
  end
end
