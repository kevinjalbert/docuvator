source 'https://rubygems.org'
gemspec

group :test do
  gem "simplecov"
  gem "guard-rspec"
  gem "tailor"
  gem 'coveralls', require: false
end

group :development do
  gem "pry-debugger"
  gem "pry-stack_explorer"
end

group :darwin do
  gem "rb-fsevent"
  gem "terminal-notifier-guard"
end

gem "rake"
gem "treat"
gem "nokogiri"
gem "scalpel" # For treat's segment
gem "engtagger" # For treat's category
