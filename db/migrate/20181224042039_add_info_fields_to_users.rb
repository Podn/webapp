class AddInfoFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :services, :string
    add_column :users, :rss, :string
    add_column :users, :details, :string
  end
end
