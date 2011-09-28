source 'http://rubygems.org'

gem 'rails', '~> 3.1.1.rc1'

#Gives rails the javascript runtimes it needs on heroku (RC4)
group :production do
  gem 'execjs'
  gem 'therubyracer'
end

#Latest Rake blows up on heroku
gem 'rake', '0.8.7'

#Run jquery-rails gem to add csrf to all ajax requests
gem "jquery-rails"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem "devise", "1.4.2"
gem "braintree"
gem "multi_json"

# Included to calculate dates, it's da illest!
gem "chronic"

# RABL JSON templates
#gem 'rabl', :git => 'git://github.com/skyeagle/rabl.git'

# Asset template engines
gem 'sass'
gem 'coffee-script'
gem 'uglifier'

# Paperclip stores attachments
gem "paperclip", "2.4.0"
gem "aws-s3"


gem "bluecloth"

group :development, :test do
  #Automated continuous testing
  #gem "guard"
  #gem "guard-rspec", :git => "git://github.com/guard/guard-test.git", :branch => "drb"
  #gem "guard-spork"
  #gem "test-unit" #TDD framework
  #gem 'shoulda' #BDD for test unit
  #gem "factory_girl" #Factories
  #gem "factory_girl_rails" #Helpers for factories
  #gem 'sqlite3' #For Nick
  #gem 'spork', '~> 0.9.0.rc' #For Testing speed.
  #gem "spork-testunit"
  #gem 'lorem' # Lorem Generates Random Text creating Sample Documents
  #gem "sauce" #Plugin to get selenium integration tests up
  #gem 'simplecov' #Coverage testing
  #gem "jslint_on_rails" #gem for running jslint in our testing env
  #gem "timecop" #Gem for mocking and testing dates/times
  gem "rspec-rails", ">= 2.5.0"
  gem "factory_girl", ">= 1.1.3"
  gem "spork", ">= 0.8.4"
  gem "database_cleaner", ">= 0.6.6"
end

#------------------------------------- Changes from Gemfile to Gemfile
gem 'bourbon', :git => "git://github.com/rsgong/bourbon.git"

gem "heroku"


