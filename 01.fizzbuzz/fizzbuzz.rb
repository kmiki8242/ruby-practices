sum = 0
numbers = []

while sum < 20
  sum += 1
  numbers.push sum
end

numbers.each do |number|
  if number % 15 == 0
    puts "FizzBuzz"
  elsif number % 3 == 0
    puts "Fizz"
  elsif number % 5 == 0
    puts "Buzz"
  else
    puts number
  end
end
