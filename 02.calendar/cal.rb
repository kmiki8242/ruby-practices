#!/usr/bin/env ruby
require 'optparse'
require 'date'

opt = OptionParser.new
params = {}

opt.on('-m [VAL]') {|v| v }
opt.on('-y [VAL]') {|v| v }
opt.parse!(ARGV, into: params)

today = Date.today
if params[:m] == nil
  month = today.month
else
  month = params[:m].to_i
end

if params[:y] == nil
  year = today.year
else
  year = params[:y].to_i
end

first_day = Date.new(year, month, 1)
last_day =  Date.new(year, month, -1)

location_at_first_day_of_the_week = 3 * first_day.wday

dates_in_week = []

# カレンダーの表示
puts "#{month}月 #{year}".rjust(13)
puts "日 月 火 水 木 金 土"
print "\s" * location_at_first_day_of_the_week

(first_day..last_day).each do |date|
  dates_in_week.push("#{date.day}".rjust(2))
  if date.saturday? || date == last_day
    puts dates_in_week.join("\s")
    dates_in_week = []
  end
end
