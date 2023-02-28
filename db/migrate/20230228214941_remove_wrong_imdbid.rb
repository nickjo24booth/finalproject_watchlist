class RemoveWrongImdbid < ActiveRecord::Migration[6.0]
  def change
    remove_column :releases, :imdb_id
  end
end
