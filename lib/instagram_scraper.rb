class InstagramScraper
  #code
  def self.get_user_basic_json(name)
    info_json = load_json("https://www.instagram.com/web/search/topsearch/?query=#{name}")
    first_user = info_json['users'][0] unless info_json['users'].nil? || info_json['users'].empty?
    user = first_user['user'] unless first_user.nil? || first_user['username'] == name
  end

  def self.load_json(url)
    #code
    JSON.load(open(url))
  end

  def self.load_media_json(name)
    #code
    media_json = load_json("https://www.instagram.com/#{name}/media")
  end

  def self.get(name)
    basic_json = get_user_basic_json name
    media_json = load_media_json name
    @user = InstagramUser.new
    @user.username = basic_json['username']
    @user.follower_count = basic_json['follower_count']
    @user.profile_pic_url = basic_json['profile_pic_url']
    @user.is_private = basic_json['is_private']
    @user.media_json = media_json
    @user
  end
end

require 'open-uri'
require "json"
