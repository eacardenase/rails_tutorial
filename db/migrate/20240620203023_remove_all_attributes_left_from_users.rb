class RemoveAllAttributesLeftFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_columns(:users, :birth, :city, :country, :gender, :role)
  end
end
