require "nokogiri"
require "open-uri"
require "json"

namespace :cases do

  desc "Scrapping data and storing inside database."
  task scrapper: :environment do
  	begin 
  		file = File.read(Rails.root.join('lib', 'tasks', 'case_title.json'))

data_hash = JSON.parse(file)

data_hash.each do | line|
	url = line["case_url"]
	#puts url
	doc =Nokogiri::HTML(open(url))
	title = doc.title
   data =  doc.xpath('//*[@id="layout_zone1"]/div').text
  law_case= Case.new(title: title , content: data)
  law_case.save
   #Case.update(title: title , content: data)
    puts title

 rescue Errno::ENOENT => e

 	if Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}")).class == Nokogiri::HTML::Document 
 		doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}"))
 		title = doc.title
 		law_case= Case.new(title: title , content: data)
 		law_case.save
 		#data=  doc.xpath('//*[@id="layout_zone1"]/div').text
 		#Case.update(title: title , content: data)
 		#puts data
 		puts title

 	else  
   doc =Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
   title = doc.title
   data =  doc.xpath('//*[@id="layout_zone1"]/div').text
   #Case.update(title: title , content: data)
 	#puts data
 	law_case= Case.new(title: title , content: data)
 	law_case.save
 	puts title 
end 
end 
end 
  end

end
