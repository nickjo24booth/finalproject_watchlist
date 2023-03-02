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
end
