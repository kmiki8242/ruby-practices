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

all_frame_scores = shots.each_slice(2).to_a

def strike?(frame_scores)
  frame_scores[0] == 10
end

point = 0

all_frame_scores.each_with_index do |frame_scores, idx|
  point += frame_scores.sum

  next if idx > 8 || frame_scores.sum != 10

  point += all_frame_scores[idx + 1][0]

  next unless strike?(frame_scores)

  point += if all_frame_scores[idx + 1][0] == 10
             all_frame_scores[idx + 2][0]
           else
             all_frame_scores[idx + 1][1]
           end
end

puts point
