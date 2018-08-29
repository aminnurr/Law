require "nokogiri"
require "open-uri"
require 'mechanize'
require "json"





#end
 #doc = Nokogiri::HTML(open(casename_url))

#data=  doc.xpath('//*[@id="layout_zone1"]/div').text


begin 
 file = File.read('/home/dave/Law/lib/tasks/case_title.json')
#file = File.read('case_title.json')

data_hash = JSON.parse(file)

data_hash.each do | line|
	url = line["case_url"]
	puts url
	doc = Nokogiri::HTML(open(url))
puts doc.title 

if doc.class !=  Nokogiri::HTML::Document 
  # doc =  Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}"))
   doc =Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
   puts doc.title

 else doc =Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
   put doc.title 

 end 
 	 

		
#if Nokogiri::HTML(open(url)).class !=  Nokogiri::HTML::Document && Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}")).class != Nokogiri::HTML::Document
   #doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}"))
  
   #puts doc.title

   #elsif   Nokogiri::HTML(open(url)).class != Nokogiri::HTML::Document &&  Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}")).class !=  Nokogiri::HTML::Document
   #doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
	
	 #puts doc.title

	#else 
	#	 doc = Nokogiri::HTML(open(@url))
	#	 puts doc.title
	#puts (("http://www.e-lawresources.co.uk/#{url}"))




 	
	#if Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}")).class != Nokogiri::HTML::Document  && Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}")).class != Nokogiri::HTML::Document

	#doc = 	Nokogiri::HTML(open(url))
	 #puts doc.title
	
      # elsif  Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}")).class != Nokogiri::HTML::Document && Nokogiri::HTML(open(url)).class != Nokogiri::HTML::Document
       #	  doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}"))
       	#  puts doc.title
 
        #	else   Nokogiri::HTML(open(url)).class != Nokogiri::HTML::Document && Nokogiri::HTML(open("http://www.e-lawresources.co.uk/#{url}")).class != Nokogiri::HTML::Document
       	#	     doc = Nokogiri::HTML(open("http://www.e-lawresources.co.uk/cases/#{url}"))
       	#	     puts doc.title     

        	end 
rescue URI::InvalidURIError
  puts "gets hoes"
        end 
   # end 
 
     
   # end
 #rescue URI::InvalidURIError
 #		doc = Nokogiri::HTML(open('http://www.e-lawresources.co.uk/cases/"#{url}"'))


    	#rescue Mechanize::ResponseCodeError   => e 
         
        #if Nokogiri::HTML(open('http://www.e-lawresources.co.uk/cases/"#{url}"')).class != Nokogiri::HTML::Document
        
        #doc = Nokogiri::HTML(open('http:///www.e-lawresources.co.uk/"#{url}"'))	
        #puts doc.title


    #else doc =  Nokogiri::HTML(open('http://www.e-lawresources.co.uk/cases/"#{url}"'))
    #	puts doc.title

    #end
         
          #	rescue NoMethodError =>a
          #		 if Nokogiri::HTML(open('http://www.e-lawresources.co.uk/cases/"#{url}"')).class != Nokogiri::HTML::Document
        
        #doc = Nokogiri::HTML(open('http:///www.e-lawresources.co.uk/"#{url}"'))	
        # puts doc.title

         #else doc =  Nokogiri::HTML(open('htt[://http://www.e-lawresources.co.uk/cases/"#{url}"'))
         #	puts doc.title
          		
 


      
# if url works then continue, and use nokogiri to grab title,and what was held in the case 
#elsif url doesnt work add  "http:://www.e-lawresources.co.uk/"
# else add httpLL//elawresources.co.uk/cases in front of case
# else rescue error


	#if /^http*/.match(info)
     #doc = Nokogiri::HTML(open(line))
     #puts doc.title

 #else 

 #	next 
#end

