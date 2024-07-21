#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

i = 0
frames = {}
all_frame_scores = shots.each_slice(2).to_a
while i < all_frame_scores.length
  frames[i] = all_frame_scores[i]
  i += 1
end

def strike?(frame_scores)
  frame_scores[0] == 10
end

def spare?(frame_scores)
  frame_scores.sum == 10
end

point = 0

frames.each do |frame, frame_scores|
  point += frame_scores.sum

  next if frame > 8

  if strike?(frame_scores)
    point += frames[frame + 1][0]
    point += if frames[frame + 1][0] == 10
               frames[frame + 2][0]
             else
               frames[frame + 1][1]
             end
  elsif spare?(frame_scores)
    point += frames[frame + 1][0]
  end
end

puts point
