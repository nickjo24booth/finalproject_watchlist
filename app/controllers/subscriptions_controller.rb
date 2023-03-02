class SubscriptionsController < ApplicationController
  def index
    # sources_url = "https://api.watchmode.com/v1/sources/?apiKey=CJ3pKXmnPcgBLUEVstAYuYDvlN4XCY36rfPSEpdU"

    # require "open-uri"
    # raw_response = URI.open(sources_url).read

    # require "json"
    # @parsed_sources = JSON.parse(raw_response)

    @all_services = Source.all

    matching_subscriptions = @current_user.subscriptions

    @list_of_subscriptions = matching_subscriptions.order({ :service => :desc })

    #Test

    matching_releases = Release.all
    service_id_array = matching_releases.map_relation_to_array(:service_id)

    service_id_array.each do |id|
      instance_variable_set("@test_#{id}", id + 1)
    end

    render({ :template => "subscriptions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_subscriptions = Subscription.where({ :id => the_id })

    @the_subscription = matching_subscriptions.at(0)

    render({ :template => "subscriptions/show.html.erb" })
  end

  def create
    the_subscription = Subscription.new
    the_subscription.service_id = params.fetch("query_service_id")
    the_subscription.user_id = @current_user.id

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions", { :notice => "Subscription created successfully." })
    else
      redirect_to("/subscriptions", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.service = params.fetch("query_service")
    the_subscription.service_id = params.fetch("query_service_id")
    the_subscription.user_id = params.fetch("query_user_id")

    if the_subscription.valid?
      the_subscription.save
      redirect_to("/subscriptions/#{the_subscription.id}", { :notice => "Subscription updated successfully." })
    else
      redirect_to("/subscriptions/#{the_subscription.id}", { :alert => the_subscription.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_subscription = Subscription.where({ :id => the_id }).at(0)

    the_subscription.destroy

    redirect_to("/subscriptions", { :notice => "Subscription deleted successfully." })
  end
end
