#!/bin/bash

#検索したい単語を格納
word="$1"

# ロングマン現代英英辞典からindex.htmlをダウンロード
wget -q https://www.ldoceonline.com/jp/dictionary/$word

#単語の意味に該当する箇所を出力
grep -v "ThesBox" $word | sed -e "s/<span/\n<span/g" | grep "DEF" |sed -e "s/<[^>]*>//g" | sed -e "s/^/---/g"

#ダウンロードファイルを削除
rm ./$word 
