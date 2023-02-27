# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  service    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :integer
#  user_id    :integer
#
class Subscription < ApplicationRecord
  validates :service, :presence => true
  validates(:service, { :uniqueness => { :scope => [:user_id] } })
end
