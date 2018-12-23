class AddWaitlistedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :waitlisted, :boolean
  end
end
