require 'mechanize'
require 'pry'

def get_bill_info(url, state)

@test = Mechanize.new
@test.user_agent_alias = 'Mac Safari'
@test.request_headers = {"Accept-Encoding" => ""}
@test.ignore_bad_chunking = true
@test.follow_meta_refresh = true

page = @test.get(url)

selected_state = page.links.find { |link| link.text.gsub(/\s+/, "") == "#{state}" }

page = selected_state.click


log_in = page.search('a.top-hitter span.bx-title')
byebug
# location = page.search('a.location-toggle')
#log_in = page.links.find { |link| link.text == "Sign In" }



end

url = "https://www.dominionenergy.com/sign-in"
state = "Virginia"

get_bill_info(url, state)