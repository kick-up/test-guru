class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :answers, :correct, from: nil, to: true
    change_column_default :tests, :level, from: nil, to: 3
  end
end
