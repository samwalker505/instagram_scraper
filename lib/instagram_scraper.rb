class InstagramScraper
  #code

  def self.browser

  end

  def self.get_user_basic_json(name)
    info_json = load_json("https://www.instagram.com/web/search/topsearch/?query=#{name}")
    info_json['users'].find { |e| e['user']['username'] == name }['user']
  end

  def self.load_json(url)
    #code
    # JSON.load(open(url))
    uri = URI.parse(url)
    JSON.load(uri.open)

  end

  def self.load_media_json(name)
    # browser = Watir::Browser.new
    # browser.goto "https://www.instagram.com"
    # browser.link(css: '._k6cv7').when_present.click
    # browser.text_field(css: 'div._ccek6:nth-child(1) > input:nth-child(1)').set('spreadit_seeds')
    # browser.text_field(css: 'div._ccek6:nth-child(2) > input:nth-child(1)').set('spreadit2014')
    # browser.button(css: '._rz1lq').click
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

  def self.login_instagram(username, password)
    browser = Watir::Browser.new
    browser.goto "https://www.instagram.com"
    browser.link(css: '._k6cv7').click if browser.link(css: '._k6cv7').exists?
    browser.text_field(css: 'div._ccek6:nth-child(1) > input:nth-child(1)').when_present.set(username)
    browser.text_field(css: 'div._ccek6:nth-child(2) > input:nth-child(1)').when_present.set(password)
    browser.button(css: '._rz1lq').click
    # browser.div(css: '#react-root > section > main > section > div > div:nth-child(1) > article:nth-child(1) > div.ResponsiveBlock._e0mru._1ysqy').wait_until_present
    browser
  end

end

require 'nokogiri'
require "watir"
require 'open-uri'
require "json"
