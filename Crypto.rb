require 'rubygems'
require 'nokogiri'
require 'open-uri'


def  get_crypto(crypto_url)
    crypto = Hash.new  # cree un hash
    
    data = Nokogiri::HTML(open(crypto_url)) 
    row = data.css("tbody").css('tr').each{|tr|
	    crypto[tr.css('a')[1].text] = tr.css('td')[4].text.to_s.delete("\n")
		}	
    return crypto  
end
puts get_crypto("https://coinmarketcap.com/all/views/all/") 