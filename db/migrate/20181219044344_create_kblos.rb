class CreateKblos < ActiveRecord::Migration[5.1]
  def change
    create_table :kblos do |t|
      t.text :content

      t.timestamps
    end
  end
end
