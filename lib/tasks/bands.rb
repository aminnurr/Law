require 'open-uri'
require 'mechanize'
require'nokogiri'

agent = Mechanize.new 
page =  agent.get('http://wiki.d-addicts.com/What_Happens_to_My_Family%3F#Episode_Ratings ')

      details            =  page.search('//*[@id="mw-content-text"]/ul[1]').text
       synopsis           = page.search('//*[@id="mw-content-text"]/ul[2]').text
       cast               = page.search('//*[@id="mw-content-text"]/ul[3]').text
       production_credits = page.search('//*[@id="mw-content-text"]/ul[4]').text
  
        title = page.search('//*[@id="mw-content-text"]/h2[2]').text 
      names = page.search('/html/body/div[3]/div[2]/div[6]/ul[1]/li[1]/b').text
        puts title 
       puts names
        

holiday_supplies = {
  "winter" => { 
    "Christmas" => ["lights", "tree"],
    "New Years" => "champagne glasses"
  },
  "summer" => {
    "July Fourth" => ["BBQ", "flags"]
  },
  "spring" => {
    "Memorial Day" => "BBQ"
  },
  "fall" => {
    "Labor Day" => "hot dogs"
  }
}

