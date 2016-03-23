Gem::Specification.new do |s|
  s.name        = 'japanese-name'
  s.version     = '0.1.1'
  s.date        = '2016-03-22'
  s.summary     = "This Ruby library convert known Japanese names in Kanji or Hiragana to Romaji, or ASCII."
  s.description = "This Ruby library convert known Japanese names in Kanji or Hiragana to Romaji, or ASCII."
  s.authors     = ["Terry Yin"]
  s.email       = 'terry.yinzhe@gmail.com'
  s.files       = ["lib/japanese-name.rb", "lib/data.json"]
  s.homepage    =
    'https://github.com/terryyin/japanese-names-rb'
  s.license       = 'MIT'

  s.add_dependency 'json'
  s.add_dependency 'romaji', '~> 0.2.3'
  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 3.4.0"
  s.add_development_dependency "rspec-its"
end
