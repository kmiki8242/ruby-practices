#!/usr/bin/env ruby
require 'optparse'
require 'date'

opt = OptionParser.new
params = {}

opt.on('-m [VAL]') {|v| v }
opt.on('-y [VAL]') {|v| v }
opt.parse!(ARGV, into: params)

if params[:m] != nil
  month = params[:m].to_i
else
  month = Date.today.strftime('%m').to_i
end

if params[:y] != nil
  year = params[:y].to_i
else
  year = Date.today.strftime('%Y').to_i
end

# 月の初日の曜日を取得
FirstDayOfTheWeek = Date.new(year, month, 1).strftime('%w').to_i

# 月の最終日の日付を取得
LastDate = Date.new(year, month, -1).strftime('%e').to_i

# 2日から最終日までの日付(key)と曜日(value)をハッシュにまとめる
date = 2
dates = {}
while date <= LastDate
  day_of_the_week = Date.new(year, month, date).strftime('%w').to_i
  dates[date] = day_of_the_week
  date += 1
end

# カレンダーの表示
puts "#{month}月 #{year}".rjust(13)
puts "日 月 火 水 木 金 土"
LocationAtFirstDayOfTheWeek = 2 + 3 * FirstDayOfTheWeek
print "#{1.to_s.rjust(LocationAtFirstDayOfTheWeek)}"

dates.each do |date, day_of_the_week|
  if day_of_the_week == 0
    printf("\n%2d", date)
  else
    printf("%3d", date)
  end
end
