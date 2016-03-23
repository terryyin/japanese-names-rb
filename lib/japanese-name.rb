# encoding: utf-8
require "json"
require "romaji"

class JapaneseName < Struct.new(:hiragana, :kanji)

  class NotFound < RuntimeError
  end

  def self.to_hiragana(name)
    all_kanji_names[name] || raise(NotFound.new name)
  end

  def self.to_ascii(name)
    Romaji.kana2romaji(to_hiragana(name))
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
