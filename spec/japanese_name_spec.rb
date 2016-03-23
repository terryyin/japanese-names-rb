# encoding: utf-8

describe JapaneseName do

  let(:hiragana_family_name) {"きよし"}
  let(:kanji_family_name) {"清"}
  let(:ascii_family_name) {"kiyoshi"}
  let(:unknown_name) {"尹哲是个程序员"}

  describe "Janese family/given name to Hiragana" do
    subject {JapaneseName.to_hiragana(@family_name)}

    context "Family name in Hiragano" do
      before {@family_name = hiragana_family_name}
      it{is_expected.to eq hiragana_family_name}
    end

    context "Family name in Kanji" do
      before {@family_name = kanji_family_name}
      it{is_expected.to eq hiragana_family_name}
    end

    context "Family name in Kanji" do
      before {@family_name = unknown_name}
      it{expect{subject}.to raise_error JapaneseName::NotFound}
    end

  end
  describe "Janese family/given name to Hiragana" do
    subject {JapaneseName.to_ascii(@family_name)}

    context "Family name in Kanji" do
      before {@family_name = kanji_family_name}
      it{is_expected.to eq ascii_family_name}
    end

  end

end
