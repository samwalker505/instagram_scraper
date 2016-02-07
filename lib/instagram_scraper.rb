class InstagramScraper
  #code

  def initialize(username, password)
    @username = username
    @password = password
  end

  def get(name)
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

  private
    def load_media_json(name)
      load_json "https://www.instagram.com/#{name}/media"
    end

    def login_instagram(username, password)
      browser = Watir::Browser.new :phantomjs
      browser.driver.manage.timeouts.implicit_wait = 180 #180 seconds
      browser.goto "https://www.instagram.com/accounts/login/"
      browser.text_field(css: 'div._ccek6:nth-child(1) > input:nth-child(1)').when_present.set(username)
      browser.text_field(css: 'div._ccek6:nth-child(2) > input:nth-child(1)').when_present.set(password)
      browser.button(css: '._rz1lq').click
      browser.div(css: '._l09h7').wait_until_present
      browser
    end

    def get_user_basic_json(name)
      info_json = load_json "https://www.instagram.com/web/search/topsearch/?query=#{name}"
      info_json['users'].find { |e| e['user']['username'] == name }['user']
    end

    def load_json(url)
      #code
      # JSON.load(open(url))
      b = login_instagram @username, @password
      b.goto url
      html_doc = Nokogiri::HTML(b.html)
      json_string = html_doc.css('pre').first.content
      json = JSON.load(json_string)
    end
end

require 'watir-webdriver'
require 'nokogiri'
require 'open-uri'
require "json"
