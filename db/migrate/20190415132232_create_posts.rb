class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |c|
      c.string :title
      c.text :content
      c.belongs_to :category, index: true
      c.belongs_to :user, index: true
      c.timestamps
    end
  end
end
