class AddColumnsToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :place, :string
    add_column :spots, :address, :string
    add_column :spots, :one_word, :string
    add_column :spots, :thought, :text
    add_column :spots, :user_id,  :integer
  end
end
