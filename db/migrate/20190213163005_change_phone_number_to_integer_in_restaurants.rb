class ChangePhoneNumberToIntegerInRestaurants < ActiveRecord::Migration[5.2]
  def change
    change_column :restaurants, :phone_number, :string
  end
end
