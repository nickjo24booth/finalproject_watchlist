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
end
