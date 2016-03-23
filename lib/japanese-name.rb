# encoding: utf-8
require "json"

class JapaneseName < Struct.new(:hiragana, :kanji)

  def self.to_hiragana(name)
    all_kanji_names[name] || name
  end

  def self.all_kanji_names
    @@all_kanji_names ||= read_all_kanji_names(File.expand_path "../data.json", __FILE__)
  end

  def to_json(options={})
    {hiragana: hiragana, kanji: kanji}.to_json options
  end

  private
  def self.read_all_kanji_names(file)
    JSON.parse(File.read(file).encode(Encoding::UTF_8))
  end
end
