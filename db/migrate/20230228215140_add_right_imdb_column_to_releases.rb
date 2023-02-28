class AddRightImdbColumnToReleases < ActiveRecord::Migration[6.0]
  def change
    add_column :releases, :imdb_id, :string
  end
end
