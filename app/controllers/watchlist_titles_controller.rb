class WatchlistTitlesController < ApplicationController
  def index
    matching_watchlist_titles = WatchlistTitle.all

    @list_of_watchlist_titles = matching_watchlist_titles.order({ :created_at => :desc })

    render({ :template => "watchlist_titles/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_watchlist_titles = WatchlistTitle.where({ :id => the_id })

    @the_watchlist_title = matching_watchlist_titles.at(0)

    render({ :template => "watchlist_titles/show.html.erb" })
  end

  def create
    the_watchlist_title = WatchlistTitle.new
    the_watchlist_title.title_id = params.fetch("query_title_id")
    the_watchlist_title.status_id = params.fetch("query_status_id")
    the_watchlist_title.user_id = params.fetch("query_user_id")

    if the_watchlist_title.valid?
      the_watchlist_title.save
      redirect_to("/watchlist_titles", { :notice => "Watchlist title created successfully." })
    else
      redirect_to("/watchlist_titles", { :alert => the_watchlist_title.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_watchlist_title = WatchlistTitle.where({ :id => the_id }).at(0)

    the_watchlist_title.title_id = params.fetch("query_title_id")
    the_watchlist_title.status_id = params.fetch("query_status_id")
    the_watchlist_title.user_id = params.fetch("query_user_id")

    if the_watchlist_title.valid?
      the_watchlist_title.save
      redirect_to("/watchlist_titles/#{the_watchlist_title.id}", { :notice => "Watchlist title updated successfully."} )
    else
      redirect_to("/watchlist_titles/#{the_watchlist_title.id}", { :alert => the_watchlist_title.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_watchlist_title = WatchlistTitle.where({ :id => the_id }).at(0)

    the_watchlist_title.destroy

    redirect_to("/watchlist_titles", { :notice => "Watchlist title deleted successfully."} )
  end
end
