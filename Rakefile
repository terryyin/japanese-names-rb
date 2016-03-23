require "bundler/gem_tasks"
require "rake/clean"
require "rspec/core/rake_task"
require "json"
require File.expand_path("lib/crawler")

desc 'update the data from web pages'
task :update_data do
  File.open("lib/givenname.json","w") do |f|
    f.write Hash[
      [
        "http://web.archive.org/web/20060206222600/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00100.html",
        "http://web.archive.org/web/20060206222547/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00200.html",
        "http://web.archive.org/web/20060206222529/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00300.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00400.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00500.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00600.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00700.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00800.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-00900.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-01000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-01500.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-02000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-02500.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-03000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-04000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-08000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-12000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-15000.html",
        "http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-25000.html"
      ].collect{|url| Crawler.new(url).get_names}
        .flatten
        .reverse
        .collect{|name| [name.kanji, name.hiragana]}
    ].to_json
  end
end

desc 'update the data from web pages'
task :update_surname do
  File.open("lib/surname.json","w") do |f|
    f.write Hash[
      File.open(File.expand_path("../surname.csv", __FILE__), "r:UTF-8")
      .read
      .scan(/\"(.*?),(.*?)\"/)
      .collect{|h, k| [k, h]}].to_json
  end
end

RSpec::Core::RakeTask.new(:spec) do |t|
    t.fail_on_error = false
end

task default: :spec
