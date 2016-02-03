require "minitest/autorun"
require "instagram_scraper"
require "instagram_user"
describe InstagramUser do
  describe "when user get by InstagramScraper" do
    user = InstagramScraper.get('samwalker505')
    it "should InstagramUser username be the same" do
      user.username.must_equal "samwalker505"
    end

    it "should InstagramUser follower_count be the same" do
      user.follower_count.must_equal 168
    end

    it "should InstagramUser avg likes is correct" do
      user.avg_likes.must_equal 5
    end
  end
end
