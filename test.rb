require 'mechanize'
require 'pry'

def generate_procedure_choices(url)

@test = Mechanize.new
@test.user_agent_alias = 'Mac Safari'
@test.request_headers = {"Accept-Encoding" => ""}
@test.ignore_bad_chunking = true
@test.follow_meta_refresh = true


page = @test.get(url)

# clinic_location_item = page.search('li.item-list div.clinic-location')
# clinic_locations = []
# clinic_location_item.each do |item|
#     clinic_locations << item.text.strip
# end

# clinic_name_item = page.search('li.item-list h3.clinic-name a')
# clinic_names = []
# clinic_names_href = []
# clinic_name_item.each do |link|
#     clinic_names << link.text.strip[0..-54]
#     clinic_names_href << link['href']
# end

# price_item = page.search('span.price em')
# prices_list = []
# price_item.each do |item|
#     prices_list << item.text.strip
# end
# prices = prices_list.uniq

# completed_items = []
# count = 0
# while count <= clinic_names.length do
#     completed_items << [clinic_names[count] , clinic_names_href[count] , clinic_locations[count] , prices[count]] 
#     count += 1
# end

# puts completed_items

# Work on this for ratings
rating_items = page.search('p.rating-small span')
ratings = []
rating_items.each do |item|
    value = item.text.strip.to_i
    if value < 10
        item = 0
    elsif value == 10 || value > 20
        item = 0.5
    elsif value == 20 || value > 30
        item = 1.0
    elsif value == 30 || value > 40
        item = 1.5
    elsif value == 40 || value > 50
        item = 2.0
    elsif value == 50 || value > 60
        item = 2.5
    elsif value == 60 || value > 70
        item = 3.0
    elsif value == 70 || value > 80
        item = 3.5
    elsif value == 80 || value > 90
        item = 4.0
    elsif value == 90 || value > 100
        item = 4.5
    elsif value == 100
        item = 5.0
    end
    ratings << item
end


puts ratings

end

url = 'https://www.medigo.com/en-us/plastic-and-cosmetic-surgery/facelift/all/hungary?sort=best_match&lang_filter=en'

generate_procedure_choices(url)