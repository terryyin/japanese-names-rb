# encoding: utf-8

describe JapaneseName do

  let(:unknown_name) {"尹哲是个程序员"}

  shared_examples_for "name part to hiragana" do
    describe "Janese given name to Hiragana" do

      context "Family name in Hiragano" do
        before {@name = hiragana_name}
        it{is_expected.to eq hiragana_name}
      end

      context "Family name in Kanji" do
        before {@name = kanji_name}
        it{is_expected.to eq hiragana_name}
      end

      context "Family name in Kanji" do
        before {@name = unknown_name}
        it{expect{subject}.to raise_error JapaneseName::NotFound}
      end

    end

  end

  shared_examples_for "name part to ascii" do
    describe "Janese given name to ascii" do

      context "Family name in Kanji" do
        before {@name = kanji_name}
        it{is_expected.to eq ascii_name}
      end

    end
  end

  describe "Given name" do
    let(:hiragana_name) {"きよし"}
    let(:kanji_name) {"清"}
    let(:ascii_name) {"kiyoshi"}

    describe "to hiragana" do
      subject {JapaneseName.given_name_to_hiragana(@name)}
      it_behaves_like "name part to hiragana"
    end

    describe "to ascii" do
      subject {JapaneseName.given_name_to_ascii(@name)}
      it_behaves_like "name part to ascii"
    end

  end

  describe "Family name" do
    let(:hiragana_name) {"かまた"}
    let(:kanji_name) {"鎌田"}
    let(:ascii_name) {"kamata"}

    describe "to hiragana" do
      subject {JapaneseName.family_name_to_hiragana(@name)}
      it_behaves_like "name part to hiragana"
    end

    describe "to ascii" do
      subject {JapaneseName.family_name_to_ascii(@name)}
      it_behaves_like "name part to ascii"
    end

  end
end
