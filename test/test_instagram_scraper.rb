require "minitest/autorun"
require "instagram_scraper"
require "instagram_user"
describe InstagramScraper do
  # describe "when  get_user_basic_json name" do
  #   it "shouldn't be nil" do
  #     InstagramScraper.get_user_basic_json('lwy.winnie').wont_be_nil
  #   end
  #
  #   it "should be match with the json data" do
  #     InstagramScraper.get_user_basic_json('lwy.winnie')['username'].must_equal "lwy.winnie"
  #   end
  # end
  #
  # describe "when load_media_json with name" do
  #   it 'should media[items] should greater than 0' do
  #       InstagramScraper.load_media_json('jas.jim')['items'].must_be :>, 0
  #   end
  # end

  describe "when get name" do
    it "should be a instance of InstagramUser" do
      InstagramScraper.new('spreadit_seeds', 'spreadit2014').get('samwalker505').must_be_instance_of InstagramUser
    end
  end

  # describe "when login instagram" do
  #   it "should login correctly" do
  #     InstagramScraper.login_instagram('spreadit_seeds', 'spreadit2014').must_equal true
  #   end
  # end
end
