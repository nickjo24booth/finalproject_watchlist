# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#  user_id    :integer
#
class Subscription < ApplicationRecord
  validates :service, :presence => true
  validates(:service_id, { :uniqueness => { :scope => [:user_id] } })

  def service
    key = self.service_id

    matching_set = Source.where({ :api_id => key })

    the_one = matching_set.at(0)

    return the_one
  end
end
