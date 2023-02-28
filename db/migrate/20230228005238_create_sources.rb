class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.string :service_type
      t.string :image
      t.integer :api_id

      t.timestamps
    end
  end
end
