class RemoveServiceNameFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :service
  end
end
