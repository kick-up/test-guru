class AddUniqIndexTest < ActiveRecord::Migration[7.0]
  def change
    add_index :tests, [:title, :level]
  end
end
