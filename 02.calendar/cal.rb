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

# カレンダーの表示
puts "#{month}月 #{year}".rjust(13)
puts "日 月 火 水 木 金 土"
(first_day..last_day).each do |date|
  if date == first_day
    location_at_first_day_of_the_week = 2 + 3 * date.wday
    print "#{date.day.to_s.rjust(location_at_first_day_of_the_week)}"
  elsif date.wday == 0
    print"\n"
    print "#{date.day}".rjust(2)
  else
    print"#{date.day}".rjust(3)
  end
end

print "\n"
