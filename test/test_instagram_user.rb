require "minitest/autorun"
require "instagram_scraper"
require "instagram_user"
describe InstagramUser do
  describe "when user get by InstagramScraper" do
    user = InstagramScraper.get('jas.jim')
    it "should InstagramUser username be the same" do
      user.username.must_equal "jas.jim"
    end

    it "should InstagramUser follower_count be the same" do
      user.follower_count.must_equal 557
    end

    it 'should have recent media' do
      user.media_json['items'].length.must_be :>, 0
    end

    it "should InstagramUser avg likes is correct" do
      user.avg_likes.must_equal 67
    end
  end
end
