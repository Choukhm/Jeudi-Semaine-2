require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_depute_name_and_email(main_url)
    regex =  /[a-z][a-z\-]+/ 
    arr = [] 
    z=0  
    data = Nokogiri::HTML(open(main_url))
    rows = data.css(".list_ann li").map{ |li| li.search('h2','.ann_mail')}
    rows.each do |data| 
      if data.inner_html  =~  regex 
            
        arr[z] =data.inner_html  
        z +=1 
      end
    end
    my_hash=Hash[*arr.flatten] 
    return my_hash
end
puts get_all_depute_name_and_email("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=577") 
