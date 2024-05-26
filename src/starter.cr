# TODO: Write documentation for `Starter`

require "http/client"
require "json"

VERSION = "0.1.0"

# Define the base URL for the Hacker News API
HACKER_NEWS_API_URL = "https://hacker-news.firebaseio.com/v0"

# Fetch the top stories IDs
def fetch_top_stories_ids
  response = HTTP::Client.get("#{HACKER_NEWS_API_URL}/topstories.json")
  response.body
end

# Fetch the details of a story by its ID
def fetch_story_by_id(id : Int32)
  response = HTTP::Client.get("#{HACKER_NEWS_API_URL}/item/#{id}.json")
  JSON.parse(response.body)
end

# Main program
top_story_ids = fetch_top_stories_ids()

channel = Channel(JSON::Any).new

ids = Array(Int32).from_json(top_story_ids)
ids.each do |elem|
  spawn do
    story = fetch_story_by_id(elem)
    title = story["title"]
    channel.send(title)
  end
end

ids.each do |elem|
  puts channel.receive
end
