class CreateFoldersLists < ActiveRecord::Migration[5.1]
  def change
    create_table :folders_lists do |t|
      t.string :guid, index: { unique: true }
      t.string :url_hash, index: { unique: true }
      t.string :folders

      t.timestamps
    end
  end
end
