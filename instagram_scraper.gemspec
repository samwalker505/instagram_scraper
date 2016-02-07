Gem::Specification.new do |s|
  s.name        = 'instagram_scraper'
  s.version     = '0.2.5'
  s.licenses    = ['MIT']
  s.summary     = "A instagram scraper to get user instagram data"
  s.description = "A instagram scraper to get user instagram data thought public api (search and media)"
  s.authors     = ["samwalker"]
  s.email       = 'samwalker505@gmail.com'
  s.files       = ["lib/instagram_scraper.rb", "lib/instagram_user.rb"]
  s.homepage    = 'http://samwalker505.github.io/'
  s.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.7.2'
  s.add_runtime_dependency 'watir-webdriver', '~> 0.9.1'
end
