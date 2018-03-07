class AddEmailToFoldersList < ActiveRecord::Migration[5.1]
  def change
    add_column :folders_lists, :email, :string
  end
end
