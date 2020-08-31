class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :year
      t.string :catch
      t.integer :collaboration
      t.integer :intensity
      t.text :detail
      t.string :category

      t.timestamps
    end
  end
end
