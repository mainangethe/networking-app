class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |c|
      c.string :name
      c.string :branch

      c.timestamps
    end
  end
end
