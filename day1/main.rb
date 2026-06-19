def grade_cal(avg)
    case
        when avg <= 100.0 && avg >= 90.0 then 'A'
        when avg < 90.0 && avg >= 80.0 then 'B'
        when avg < 80.0 && avg >= 70.0 then 'C'
        when avg < 70.0 && avg >= 60.0 then 'D'
        else 'F'
    end
end

puts "How many scores?"

score = gets.chomp()
while !/\A\d+\z/.match?(score)
    puts "Please enter a valid number !!"
    score = gets.chomp()
end
score = score.to_i
if score == 0
    puts "there are no scores available !!"
    exit 0
end

scores = []
total = 0
curr_score = 0

for i in 1..score
  puts "Enter score #{i}: "
  curr_score = gets.chomp()
  while !/\A(?:[1-9]?\d|100)\z/.match?(curr_score)
    puts "Please enter number between 0 and 100 !!"
    curr_score = gets.chomp()
  end
  curr_score = curr_score.to_i
  total+= curr_score
  scores.push(curr_score)
end

average = (total/score.to_f).round(2)

puts "Results:"
puts "\tAverage : #{average}"
puts "\tGrade : #{grade_cal(average)}"
puts"\tHighest : #{scores.max}"
puts"\tLowest : #{scores.min}"