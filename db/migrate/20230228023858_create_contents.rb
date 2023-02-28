class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :year
      t.integer :imdb_id
      t.integer :api_id
      t.string :title_type

      t.timestamps
    end
  end
end
