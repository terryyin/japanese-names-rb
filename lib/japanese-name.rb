# encoding: utf-8
require "json"
require "romaji"

class JapaneseName < Struct.new(:hiragana, :kanji)

  class NotFound < RuntimeError
  end

  def self.given_name_to_hiragana(name)
    all_kanji_given_names[name] || hiragana_presence(name) || raise(NotFound.new name)
  end

  def self.given_name_to_ascii(name)
    Romaji.kana2romaji(given_name_to_hiragana(name))
  end

  def self.all_kanji_given_names
    @@all_kanji_given_names ||= read_all_kanji_names(File.expand_path "../givenname.json", __FILE__)
  end

  def self.family_name_to_hiragana(name)
    all_kanji_family_names[name] || hiragana_presence(name) || raise(NotFound.new name)
  end

  def self.family_name_to_ascii(name)
    Romaji.kana2romaji(family_name_to_hiragana(name))
  end

  def self.all_kanji_family_names
    @@all_kanji_family_names ||= read_all_kanji_names(File.expand_path "../surname.json", __FILE__)
  end

  def to_json(options={})
    {hiragana: hiragana, kanji: kanji}.to_json options
  end

  private
  def self.read_all_kanji_names(file)
    JSON.parse(File.read(file).encode(Encoding::UTF_8))
  end

  def self.hiragana_presence(name)
    name =~ /^\p{Hiragana}+$/ ? name : nil
  end
end
