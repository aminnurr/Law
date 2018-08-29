require'open-uri'
require'json'
require 'mechanize'


	case_url=[]
mechanize = Mechanize.new
urls = ["http://www.e-lawresources.co.uk/cases/Table-of-cases-A-D.php", 
	"http://www.e-lawresources.co.uk/cases/Table-of-cases-E-J.php",
         "http://www.e-lawresources.co.uk/cases/Table-of-cases-K-Q.php", 
         "http://www.e-lawresources.co.uk/cases/Table-of-cases-R-v-A-R-v-G.php",
	    "http://www.e-lawresources.co.uk/cases/Table-of-cases-R-v-H-R-v-N.php", 
	    "http://www.e-lawresources.co.uk/cases/Table-of-cases-R-v-O-R-v-Z.php",
	  "http://www.e-lawresources.co.uk/cases/Table-of-cases-R-Z.php"]

urls.each do |url|

 
 url ={"case_url" => "#{url}" }
   case_url.push(url)
  json = JSON.pretty_generate(case_url)  
  puts url
  File.open("Case_url.json","w") {|f|f.write(json) }

end 