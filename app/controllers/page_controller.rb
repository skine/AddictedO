require 'mechanize'

#----
# 定数
API_URL = "http://find.bluek.co.jp/?callback=test_xzcvas"

class PageController < ApplicationController
  #-------------------------------------------
  # search
  #-------------------------------------------
  def search
    # 検索キーワード
    keyword = params[:search]
    
    # 絞り込み指定()
    # ページ指定

    query = {
      "q" => keyword,
      "limit" => 10,
    }
    
    url = "#{API_URL}&#{_query_string( query )}"
    
    result = Mechanize.new.get( url ).body
    puts url
  end
  
  #-------------------------------------------
  # プライベートメソッド
  #   _query_string
  #   hashをquery-stringに変換する
  #-------------------------------------------
  def _query_string( hash )
    hash.keys.map{ |k| "#{k}=#{hash[k]}"}.join( "&" )
  end
end
