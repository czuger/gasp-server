class SetGuidNotNullInFoldersList < ActiveRecord::Migration[5.1]
  def change
    change_column :folders_lists, :guid, :string, :null => false
  end
end
