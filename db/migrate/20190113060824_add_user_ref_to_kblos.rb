class AddUserRefToKblos < ActiveRecord::Migration[5.1]
  def change
    add_reference :kblos, :user, foreign_key: true
  end
end
