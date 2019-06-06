# require 'open-uri'
require 'nokogiri'
require 'byebug'
require 'httparty'

def snow_scraper
	snow_report_url = "https://www.skiresort.info/snow-reports/north-america/"
	unparsed_page = HTTParty.get(snow_report_url)
	parsed_page = Nokogiri::HTML(unparsed_page)
	snow_reports = Array.new
	snow_report_listings = parsed_page.css('div.panel-body.middle-padding')
	page = 1
	per_page = snow_report_listings.count #50
	total = parsed_page.css('span.pagebrowser-pageinfo-count').children[0].inner_text.to_i #88
	last_page = (total.to_f / per_page.to_f).round #2


	while page <= last_page
		pagination_url = "https://www.skiresort.info/snow-reports/north-america/page/#{page}"
		puts pagination_url
		puts "Page: #{page}"
		puts ''
		pagination_unparsed_page = HTTParty.get(pagination_url)
		pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
		pagination_snow_report_listings = pagination_parsed_page.css('div.panel-body.middle-padding')

		pagination_snow_report_listings.each do |res|
			snow_report = {
					title: res.css('.h3').children[1].inner_text,
					# table_data: res.css('.info-table').inner_text,
					elevation: res.css('.info-table').children[1].children[3].text,
					status: res.css('.info-table').children[3].children[3].text,
					depth: res.css('.info-table').children[5].children[3].text,
					slopes: res.css('.info-table').children[7].children[3].inner_text,
					lifts: res.css('.info-table').children[9].children[3].text,
					link: res.css('.h3').first.children[1].attributes["href"].value
				}
			snow_reports << snow_report
			puts "Added Snow Report For#{snow_report[:title]}"
			puts ""
		end
		page += 1
	end
	puts "-----------------------------------------------------------------------------------------------------------------------------"
end


def forecast_scraper
	forecast_url = "https://www.skiresort.info/weather/north-america/"
	unparsed_page = HTTParty.get(forecast_url)
	parsed_page = Nokogiri::HTML(unparsed_page)
	forecasts = Array.new
	forecast_listings = parsed_page.css('div.panel-body.middle-padding')
	page = 1
	per_page = forecast_listings.count #50
	total = parsed_page.css('span.pagebrowser-pageinfo-count').children[0].inner_text.to_i #88
	last_page = (total.to_f / per_page.to_f).round #2

	while page <= last_page
		pagination_url = "https://www.skiresort.info/weather/north-america/page/#{page}"
		puts pagination_url
		puts "Page: #{page}"
		puts ''
		pagination_unparsed_page = HTTParty.get(pagination_url)
		pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
		pagination_forecast_listings = pagination_parsed_page.css('div.panel-body.middle-padding')

		pagination_forecast_listings.each do |res|
			forecast= {
					title: res.css('.h3').children[1].inner_text,
					# table_data: res.css('.info-table').inner_text,
					:on_mountain =>
						{
							res.css('.col-xs-12').children[1].children[1].children[1].children[3].inner_text =>
							{

								#tues: res.css('.col-xs-12').children[1].children[3].children[1].children[1].inner_text
								Tues: res.css('.col-xs-12').children[1].children[3].children[1].children[3].text,
								Weds: res.css('.col-xs-12').children[1].children[3].children[3].children[3].text,
								Thurs: res.css('.col-xs-12').children[1].children[3].children[5].children[3].text,
								Fri: res.css('.col-xs-12').children[1].children[3].children[7].children[3].text,
								Sat: res.css('.col-xs-12').children[1].children[3].children[9].children[3].text,
								Sun: res.css('.col-xs-12').children[1].children[3].children[11].children[3].text,
								Mon: res.css('.col-xs-12').children[1].children[3].children[13].children[3].text
							}
						},

					:at_base =>
						{
							res.css('.col-xs-12').children[1].children[1].children[1].children[5].inner_text =>
							{
								Tues: res.css('.col-xs-12').children[1].children[3].children[1].children[5].text,
								Weds: res.css('.col-xs-12').children[1].children[3].children[3].children[5].text,
								Thurs: res.css('.col-xs-12').children[1].children[3].children[5].children[5].text,
								Fri: res.css('.col-xs-12').children[1].children[3].children[7].children[5].text,
								Sat: res.css('.col-xs-12').children[1].children[3].children[9].children[5].text,
								Sun: res.css('.col-xs-12').children[1].children[3].children[11].children[5].text,
								Mon: res.css('.col-xs-12').children[1].children[3].children[13].children[5].text
							}
						},
					}
					#today's day of the week res.css('.col-xs-12').children[1].children[3].children[1].children[1].text

			forecasts << forecast
			puts "Added Forecast For#{forecast[:title]}"
			puts ""
		end
		page += 1
	end
		puts "-----------------------------------------------------------------------------------------------------------------------------"
end

def resort_scraper
	resort_url = "https://www.skiresort.info/ski-resorts/north-america/"
	unparsed_page = HTTParty.get(resort_url)
	parsed_page = Nokogiri::HTML(unparsed_page)
	resorts = Array.new
	resort_listings = parsed_page.css('div.panel-body.middle-padding')
	page = 1
	per_page = resort_listings.count #50
	total = parsed_page.css('span.pagebrowser-pageinfo-count').children[0].inner_text.to_i #88
	last_page = (total.to_f / per_page.to_f).round #2

	while page <= last_page
		pagination_url = "https://www.skiresort.info/ski-resorts/north-america/page/#{page}"
		puts pagination_url
		puts "Page: #{page}"
		puts ''
		pagination_unparsed_page = HTTParty.get(pagination_url)
		pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
		pagination_resort_listings = pagination_parsed_page.css('div.panel-body.middle-padding')

		pagination_resort_listings.each do |res|
			resort= {}
					res.css('.h3') ? resort[:title] = res.css('.h3').children[1].inner_text : resort[:title] = ''
					res.css('.resort-list-item-img-wrap') ? resort[:img] = res.css('.resort-list-item-img-wrap').children[1].children[1].children[1].values[1] : resort[:img] = ''
					res.css('.info-table').children[1].children[2] ? resort[:elevation_gain] = res.css('.info-table').children[1].children[2].children[3].inner_text : resort[:elevation_gain] = ''
					res.css('.info-table').children[1].children[4] ? resort[:skiiable_terrain] = res.css('.info-table').children[1].children[4].children[3].children[0].inner_text : resort[:skiiable_terrain] = ''
					res.css('.info-table').children[1].children[4] ? resort[:beginner] = res.css('.info-table').children[1].children[4].children[3].inner_text : resort[:beginner] = ''
					res.css('.info-table').children[1].children[4] ? resort[:intermediate] = res.css('.info-table').children[1].children[4].children[3].inner_text : resort[:intermediate] = ''
					res.css('.info-table').children[1].children[4] ? resort[:expert] = res.css('.info-table').children[1].children[4].children[3].inner_text : resort[:expert] = ''
					res.css('.info-table').children[1].children[6] ? resort[:total_lifts] = res.css('.info-table').children[1].children[6].inner_text : resort[:total_lifts] = ''
					res.css('.info-table').children[1].children[8] ? resort[:ticket_price] = res.css('.info-table').children[1].children[8].children[3].text : resort[:ticket_price] = ''
			resorts << resort

			puts "Added Resort#{resort[:title]} "
			puts ""
		end
		page += 1
	end
		puts "-----------------------------------------------------------------------------------------------------------------------------"
end









#Calling methods
snow_scraper
forecast_scraper
resort_scraper

# # ski forecast data
#
# forecast_url = "https://www.skiresort.info/forecast/north-america/"
# 	document = open(forecast_url)
# 	forecast_content = document.read
#
# 	forecast_parsed_content = Nokogiri::HTML(forecast_content)
#
#
# 	forecast_parsed_content.css('.content').css('.panel-body').css('.middle-padding').each do |row|
# 		w_title = row.css('.h3').inner_text
# 		w_data = row.css('.no-mobile-forecastdetail').inner_text
# 		w_link = row.css('.h3').first.children[1].attributes["href"].value
#
# 		puts "Title: #{w_title}"
# 		puts "Link: #{w_link}"
# 		puts "Table Data: #{w_data}"
# 		puts '--------------------------------------------------------------------------------'
# 	end
