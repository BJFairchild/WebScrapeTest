require 'mechanize'
require 'pry'

def create_clinic_data(url)
@test = Mechanize.new
@test.user_agent_alias = 'Mac Safari'
@test.request_headers = {"Accept-Encoding" => ""}
@test.ignore_bad_chunking = true
@test.follow_meta_refresh = true




page = @test.get(url)



location = page.search('div#clinic-map p').text.strip

clinic_overview_item = page.search('div.description-markdown p')
description = clinic_overview_item.each do |item|
    if item == clinic_overview_item[-1]
        puts ""
        puts item.text
    else
        puts item.text
    end
end

@results = []
@results << location
@results << description

puts @results



#First item in review title is duplicationg due to the way the website is written. Brainstorm fix

# overall_satisfaction = "Overall Satisfaction: " + page.search('p.rating-big span').text + "%"
# puts overall_satisfaction

# review_titles_array = []

# review_title_items = page.search('span.review-title')
# review_title_items.each do |item|
#     review_titles_array << item.text.gsub(/\s+/, ' ')
# end

# puts review_titles_array[0]
end
    # puts clinic_overview
    url = 'https://www.medigo.com/en-us/clinic/india/new-delhi/primus-super-specialty-hospital-558c11b84c5d2'

    create_clinic_data(url)
