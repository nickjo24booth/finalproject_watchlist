class AddServiceToReleases < ActiveRecord::Migration[6.0]
  def change
    add_column :releases, :service_id, :integer
  end
end
