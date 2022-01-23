class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct

      t.timestamps
    end
    change_column_null :answers, :body, false
    change_column_null :answers, :correct, false
    change_column_default :answers, :correct, from: nil, to: true
  end
end
