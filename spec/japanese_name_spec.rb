# encoding: utf-8

describe JapaneseName do

  let(:hiragana_family_name) {"きよし"}
  let(:kanji_family_name) {"清"}

  describe "Janese family name to Hiragana" do
    subject {JapaneseName.to_hiragana(@family_name)}

    context "Family name in Hiragano" do
      before {@family_name = hiragana_family_name}
      it{is_expected.to eq hiragana_family_name}
    end

    context "Family name in Kanji" do
      before {@family_name = kanji_family_name}

      it{is_expected.to eq hiragana_family_name}
    end

  end
end
