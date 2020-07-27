class AddMajorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :major, :string
  end
end
