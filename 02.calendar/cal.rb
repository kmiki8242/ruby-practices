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

date_views = []

# カレンダーの表示
puts "#{month}月 #{year}".rjust(13)
puts "日 月 火 水 木 金 土"
print " ".rjust(location_at_first_day_of_the_week)

(first_day..last_day).each do |date|
  if date.wday == 6 || date == last_day
    date_views.push("#{date.day}".rjust(2))
    print date_views.join("\s")
    puts
    date_views = []
  else
    date_views.push("#{date.day}".rjust(2))
  end
end
