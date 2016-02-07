#InstagramScraper
This is Instagram Scraper that get Ig user data from the website, basically is a bot

##install

`gem install instagram_scraper`

##usage   
```ruby
require 'instagram_scraper'
@user = InstagramScraper.new('username', 'password').get('samwalker505')
@user.username  # => samwalker505
@user.is_private # => false
@user.follower_count # => 16x
@user.media_json # =>json string
@user.profile_pic_url # => url to profile_pic
@user.avg_likes # => avg_likes by media_json post
```
