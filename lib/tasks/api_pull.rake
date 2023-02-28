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
  task titles: :environment do
    require "open-uri"
    
    require "json"

    list_of_streamers = Source.all.map_relation_to_array(:api_id)

    list_of_streamers.each do |id|

      titles_url = "https://api.watchmode.com/v1/list-titles/?apiKey=CJ3pKXmnPcgBLUEVstAYuYDvlN4XCY36rfPSEpdU&source_ids=#{id}"

      raw_response = URI.open(titles_url).read

      parsed_titles = JSON.parse(raw_response)

      total_pages = parsed_titles.fetch("total_pages")

      current_page = parsed_titles.fetch("page")

      while current_page <= total_pages

        current_url = "https://api.watchmode.com/v1/list-titles/?apiKey=CJ3pKXmnPcgBLUEVstAYuYDvlN4XCY36rfPSEpdU&source_ids=#{id}&page=#{current_page}"

        response = URI.open(current_url).read

        parsed = JSON.parse(response)

        titles_array = parsed.fetch("titles")

        titles_array.each do |title|
          new_title = 
        end

        current_page = parsed.fetch("page")
      end

    #https://api.watchmode.com/v1/list-titles/?apiKey=CJ3pKXmnPcgBLUEVstAYuYDvlN4XCY36rfPSEpdU&source_ids=387,203&page=2
    end
  end
end