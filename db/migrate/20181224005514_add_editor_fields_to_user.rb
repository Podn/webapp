class AddEditorFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :editing_description, :string
    add_column :users, :previous_work, :string
  end
end
