class JapaneseName < Struct.new(:hiragana, :kanji)
  def self.family_name_to_hiragana(name)
    name
  end

  def to_json(options={})
    {hiragana: hiragana, kanji: kanji}.to_json options
  end
end
