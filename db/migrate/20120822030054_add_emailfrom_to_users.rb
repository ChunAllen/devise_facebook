class AddEmailfromToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email2, :string
  end
end
