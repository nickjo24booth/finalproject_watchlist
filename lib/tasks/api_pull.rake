namespace :api_pull do
  desc "Pull streaming sources and titles from watchmode"
  task sources: :environment do
    sources_url = "https://api.watchmode.com/v1/sources/?apiKey=CJ3pKXmnPcgBLUEVstAYuYDvlN4XCY36rfPSEpdU"

    require "open-uri"
    raw_response = URI.open(sources_url).read

    require "json"
    parsed_sources = JSON.parse(raw_response)

    nick_services = ["Netflix", "Hulu", "HBO MAX", "Disney+", "Amazon Prime", "AppleTV+", "Paramount+", "Peacock"]

    parsed_sources.each do |service|
      if nick_services.include?(service.fetch("name")) == true
        streamer = Source.new

        streamer.name = service.fetch("name")
        streamer.service_type = service.fetch("type")
        streamer.image = service.fetch("logo_100px")
        streamer.api_id = service.fetch("id")

        streamer.save
      end
    end
    p "There are #{Source.count} streamers."
  end
end
