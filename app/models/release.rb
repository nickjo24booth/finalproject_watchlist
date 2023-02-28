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
#  imdb_id    :integer
#  service_id :integer
#
class Release < ApplicationRecord
end
