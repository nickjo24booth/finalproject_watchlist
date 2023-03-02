# == Schema Information
#
# Table name: releases
#
#  id         :integer          not null, primary key
#  title      :string
#  title_type :string
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  api_id     :integer
#  imdb_id    :string
#  service_id :integer
#
class Release < ApplicationRecord
  #To get the unique values from the serivce_id column, use
  #Release.distinct.pluck(:service_id)

  belongs_to(:service, { :foreign_key => "service_id", :class_name => "Source", :primary_key => "api_id" })
end
