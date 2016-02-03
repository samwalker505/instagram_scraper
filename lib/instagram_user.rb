class InstagramUser
  attr_accessor :username, :follower_count, :is_private, :profile_pic_url, :media_json
  def avg_likes
    #code
    items = @media_json['items']
    total = items.length
    sum_likes = items.inject(0){|s, post| s + post['likes']['count']}
    @avg = sum_likes/total
  end
end
