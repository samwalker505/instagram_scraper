require "minitest/autorun"
require "instagram_scraper"
require "instagram_user"
describe InstagramScraper do
  describe "when  get_user_basic_json name" do

    it "shouldn't be nil" do
      InstagramScraper.get_user_basic_json('samwalker505').wont_be_nil
    end

    it "should be match with the json data" do
      InstagramScraper.get_user_basic_json('samwalker505')['username'].must_equal "samwalker505"
    end
  end

  describe "when get name" do
    it "should be a instance of InstagramUser" do
      InstagramScraper.get('samwalker505').must_be_instance_of InstagramUser
    end
  end

end
