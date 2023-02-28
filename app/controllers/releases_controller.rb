class ReleasesController < ApplicationController
  def index
    matching_releases = Release.all

    @list_of_releases = matching_releases.order({ :created_at => :desc })

    render({ :template => "releases/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_releases = Release.where({ :id => the_id })

    @the_release = matching_releases.at(0)

    render({ :template => "releases/show.html.erb" })
  end

  def create
    the_release = Release.new
    the_release.title = params.fetch("query_title")
    the_release.year = params.fetch("query_year")
    the_release.imdb_id = params.fetch("query_imdb_id")
    the_release.api_id = params.fetch("query_api_id")
    the_release.title_type = params.fetch("query_title_type")

    if the_release.valid?
      the_release.save
      redirect_to("/releases", { :notice => "Release created successfully." })
    else
      redirect_to("/releases", { :alert => the_release.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_release = Release.where({ :id => the_id }).at(0)

    the_release.title = params.fetch("query_title")
    the_release.year = params.fetch("query_year")
    the_release.imdb_id = params.fetch("query_imdb_id")
    the_release.api_id = params.fetch("query_api_id")
    the_release.title_type = params.fetch("query_title_type")

    if the_release.valid?
      the_release.save
      redirect_to("/releases/#{the_release.id}", { :notice => "Release updated successfully."} )
    else
      redirect_to("/releases/#{the_release.id}", { :alert => the_release.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_release = Release.where({ :id => the_id }).at(0)

    the_release.destroy

    redirect_to("/releases", { :notice => "Release deleted successfully."} )
  end
end
