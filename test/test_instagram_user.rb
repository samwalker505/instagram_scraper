require "minitest/autorun"
require "instagram_scraper"
require "instagram_user"
describe InstagramUser do
  describe "when user get by InstagramScraper" do
    user = InstagramScraper.get('lwy.winnie')
    it "should InstagramUser username be the same" do
      user.username.must_equal "lwy.winnie"
    end

    it "should InstagramUser follower_count be the same" do
      user.follower_count.must_equal 420
    end

    it "should InstagramUser avg likes is correct" do
      user.avg_likes.must_equal 20
    end
  end
end
