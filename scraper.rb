require 'nokogiri'
require 'byebug'
require 'httparty'
require 'pry'
require_relative 'config/environment.rb'



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
			@title = res.css('.h3').children[1].inner_text
			@elevation = res.css('.info-table').children[1].children[3].text.strip
			@status = res.css('.info-table').children[3].children[3].text.strip
			@depth = res.css('.info-table').children[5].children[3].text.strip
			@slopes = res.css('.info-table').children[7].children[3].inner_text.strip
			@lifts  = res.css('.info-table').children[9].children[3].text.strip
			@link = res.css('.h3').first.children[1].attributes["href"].value.strip

			snow_report = SnowReport.new(
					title: @title,
					elevation: @elevation,
					status: @status,
					depth: @depth,
					slopes: @slopes,
					lifts: @lifts,
					link: @link
				)
				snow_report.save
			# snow_reports << snow_report
			# new_snow_report = SnowReport.new(snow_report)


			puts "Added Snow Report For#{snow_report[:title]}"
			puts ""
		end
		page += 1
	end


# snow_reports=
# 	snow_reports.each do |rep|
# 		new_snow_report = SnowReport.new(rep)
# 		byebug
# 	end
	# new_snow_report.save
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
					title: res.css('.h3').children[1].inner_text.strip,
					# table_data: res.css('.info-table').inner_text,
					:today =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[1].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[1].children[3].text.strip
						},
					:tomorrow =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[3].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[3].children[3].text.strip
						},
					:day3 =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[5].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[5].children[3].text.strip
						},
					:day4 =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[7].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[7].children[3].text.strip
						},
					:day5 =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[9].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[9].children[3].text.strip
						},
					:day6 =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[11].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[11].children[3].text.strip
						},
					:day7 =>
						{
							at_base: res.css('.col-xs-12').children[1].children[3].children[13].children[5].text.strip,
							on_mountain: res.css('.col-xs-12').children[1].children[3].children[13].children[3].text.strip
						}
				}
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
					res.css('.h3') ? resort[:title] = res.css('.h3').children[1].inner_text.strip : resort[:title] = ''
					res.css('.resort-list-item-img-wrap') ? resort[:img] = res.css('.resort-list-item-img-wrap').children[1].children[1].children[1].values[1].strip : resort[:img] = ''
					res.css('.info-table').children[1].children[2] ? resort[:elevation_gain] = res.css('.info-table').children[1].children[2].children[3].inner_text.strip : resort[:elevation_gain] = ''
					res.css('.info-table').children[1].children[4] ? resort[:skiiable_terrain] = res.css('.info-table').children[1].children[4].children[3].children[0].inner_text.strip : resort[:skiiable_terrain] = ''
					res.css('.info-table').children[1].children[4] ? resort[:beginner] = res.css('.info-table').children[1].children[4].children[3].inner_text.strip : resort[:beginner] = ''
					res.css('.info-table').children[1].children[4] ? resort[:intermediate] = res.css('.info-table').children[1].children[4].children[3].inner_text.strip : resort[:intermediate] = ''
					res.css('.info-table').children[1].children[4] ? resort[:expert] = res.css('.info-table').children[1].children[4].children[3].inner_text.strip : resort[:expert] = ''
					res.css('.info-table').children[1].children[6] ? resort[:total_lifts] = res.css('.info-table').children[1].children[6].inner_text.strip : resort[:total_lifts] = ''
					res.css('.info-table').children[1].children[8] ? resort[:ticket_price] = res.css('.info-table').children[1].children[8].children[3].text.strip : resort[:ticket_price] = ''
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
# forecast_scraper
# resort_scraper
