require 'mechanize'
require 'pry'

def generate_country_choices(url)

@test = Mechanize.new
@test.user_agent_alias = 'Mac Safari'
@test.request_headers = {"Accept-Encoding" => ""}
@test.ignore_bad_chunking = true
@test.follow_meta_refresh = true


page = @test.get(url)

country_values_array = []
country_names = []
country_value_items = page.search('ul#country-filters li.field input.country-checkbox')
country_name_items = page.search('ul#country-filters li.field a')

country_value_items.each do |item|
    country_values_array << item.attr('value')
end

country_name_items.each do |item|
    country_names << item.text.strip
end

country_values = country_values_array[1..-1]

country_choices_result = {values: country_values, names: country_names}

byebug

end






url = "https://www.medigo.com/en-us/plastic-and-cosmetic-surgery/breast-reduction?sort=best_match&lang_filter=en"

generate_country_choices(url)