require "nokogiri"
require "open-uri"
require 'mechanize'
require "json"
begin 
file = File.read('case_title.json')

data_hash = JSON.parse(file)

data_hash.each do | line|
	url = line["case_url"]
	#puts url
	doc =Nokogiri::HTML(open(url))



 rescue Errno::ENOENT => e

 	if Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}")).class == Nokogiri::HTML::Document 
 		doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}"))
 		puts doc.title 
 		data=  doc.xpath('//*[@id="layout_zone1"]/div').text
 		puts data

 	else  
   doc =Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
   puts doc.title 
   data =  doc.xpath('//*[@id="layout_zone1"]/div').text
 	puts data
end 
end 
end 
