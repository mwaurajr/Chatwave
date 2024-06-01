class AddPhoneNumberToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :phone_number, :string
    add_index :users, :phone_number
  end
end
