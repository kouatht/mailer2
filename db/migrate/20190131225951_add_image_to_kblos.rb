class AddImageToKblos < ActiveRecord::Migration[5.1]
  def change
    add_column :kblos, :image, :text
  end
end
