class AddColumnsToBlogs < ActiveRecord::Migration[5.1]
  def change
    change_table :blogs do |t|
      t.string :title
      t.text :content
    end
  end
end
