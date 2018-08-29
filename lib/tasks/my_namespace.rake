require "nokogiri"
require "open-uri"
require "json"

namespace :my_namespace do

  desc "Scrapping data and storing inside database."
  task scrapper: :environment do
  	begin 
  		json_file = 'case_title.json'
  		file = File.read(json_file)
  	#path=File.absolute_path "case_title.json"
  	#file = File.open(path).read

data_hash = JSON.parse(file)

data_hash.each do | line|
	url = line["case_url"]
	#puts url
	doc =Nokogiri::HTML(open(url))
	title = doc.tite
   data=  doc.xpath('//*[@id="layout_zone1"]/div').text
   Case.update(title: title , content: content)


 rescue Errno::ENOENT => e

 	if Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}")).class == Nokogiri::HTML::Document 
 		doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}"))
 		title = doc.title
 		data=  doc.xpath('//*[@id="layout_zone1"]/div').text
 		Case.update(title: title , content: content)
 		#puts data

 	else  
   doc =Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
   puts doc.title 
   data =  doc.xpath('//*[@id="layout_zone1"]/div').text
   Case.update(title: title , content: content)
 	#puts data
end 
end 
end 
  end

end
