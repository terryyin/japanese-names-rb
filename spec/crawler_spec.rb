# encoding: utf-8
require "crawler"

describe Crawler do

  let(:crawler) {Crawler.new "url"}
  let(:page) {double}
  subject {crawler.get_names}
  before{ allow(crawler).to receive(:open) {page}}
  before{ allow(page).to receive(:read) {@content}}

  it "read from web page" do
    expect(crawler).to receive(:open).with("url")
    subject
  end

  context "1st name get from page with name ようこ,陽子" do
    before {@content = "ようこ,陽子,113,233"}
    subject {crawler.get_names.first}
    its(:hiragana) {is_expected.to eq "ようこ"}
    its(:kanji) {is_expected.to eq "陽子"}
  end

end
