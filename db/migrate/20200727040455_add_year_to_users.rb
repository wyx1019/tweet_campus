class AddYearToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :year, :string
  end
end
