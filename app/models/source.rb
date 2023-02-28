# == Schema Information
#
# Table name: sources
#
#  id           :integer          not null, primary key
#  image        :string
#  name         :string
#  service_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  api_id       :integer
#
class Source < ApplicationRecord
end
