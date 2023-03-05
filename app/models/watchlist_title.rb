# == Schema Information
#
# Table name: watchlist_titles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status_id  :integer
#  title_id   :integer
#  user_id    :integer
#
class WatchlistTitle < ApplicationRecord
  validates(:user_id, { :presence => true })
  validates(:title_id, { :uniqueness => { :scope => [:user_id] } })

  validates(:status_id, { :presence => true })

  belongs_to(:release, { :foreign_key => "title_id", :class_name => "Release", :primary_key => "api_id" })

  belongs_to(:status, { :foreign_key => "status_id", :class_name => "Status" })

  def service
    title = self.release

    key = title.service_id

    matching_set = Source.where({ :api_id => key })

    the_one = matching_set.at(0)

    return the_one
  end
end
