require "minitest/autorun"
require "instagram_scraper"
require "instagram_user"
describe InstagramScraper do
  describe "when  get_user_basic_json name" do
    it "shouldn't be nil" do
      InstagramScraper.get_user_basic_json('lwy.winnie').wont_be_nil
    end

    it "should be match with the json data" do
      InstagramScraper.get_user_basic_json('lwy.winnie')['username'].must_equal "lwy.winnie"
    end
  end

  describe "when get name" do
    it "should be a instance of InstagramUser" do
      InstagramScraper.get('samwalker505').must_be_instance_of InstagramUser
    end
  end

end
