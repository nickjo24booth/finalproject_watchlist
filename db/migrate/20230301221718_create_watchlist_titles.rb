class CreateWatchlistTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :watchlist_titles do |t|
      t.integer :title_id
      t.integer :status_id
      t.integer :user_id

      t.timestamps
    end
  end
end
