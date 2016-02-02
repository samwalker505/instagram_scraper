class InstagramScraper
  #code
  def self.get_user_basic(name)
    info_json = load_json("https://www.instagram.com/web/search/topsearch/?query=#{name}")
    first_user = info_json['users'][0] unless info_json['users'].nil? || info_json['users'].empty?
    user = first_user unless first_user.nil? || first_user['username'] == name
    puts user
  end

  def self.load_json(url)
    #code
    JSON.load(open(url))
  end

  def self.load_media_json(name)
    #code
    load_json("https://www.instagram.com/#{name}/media")
  end
end

require 'open-uri'
require "json"
