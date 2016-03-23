# japanese-names-rb

[![Build
Status](https://secure.travis-ci.org/terryyin/japanese-names-rb.png?branch=master)](http://travis-ci.org/terryyin/japanese-names-rb)
[![Gem Version](https://badge.fury.io/rb/japanese-name.svg)](https://badge.fury.io/rb/japanese-name)

This Ruby library convert known Japanese names in Kanji or Hiragana to Romaji, or ASCII. 

## Installation

    $ gem install japanese-name

## Usage

    JapaneseName.given_name_to_hiragana("清")  => "きよし"
    JapaneseName.given_name_to_ascii("清")  => "kiyoshi"
    JapaneseName.family_name_to_hiragana("鎌田")  => "かまた"
    JapaneseName.family_name_to_ascii("鎌田")  => "kamata"

So far it works only with name parts (Family name, or given name). There
could be a feature to guess what is the family name and what is the
given name. But I don't need it for now, so won't do it until somebody
request that.

## Source of data

The names are grabbed from:
http://web.archive.org/web/20060518234359/http://www.kokemus.kokugo.juen.ac.jp/names/namae/NA-index.html

To update the names, run:

    rake update_data
    rake update_surname

## Limitation

For duplicated entries, now the solution is to take only the more
frequent spelling.

It knows 59044+ (Mar 2016) Japanese family name and/or given names. It
throws except for unknown name. Sorry for the exception, I know it's
annoying. But is there a better alternative?
