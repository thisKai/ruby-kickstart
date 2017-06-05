# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.
def unit_digit_string(digit)
  case digit
  when 0 then 'zero'
  when 1 then 'one'
  when 2 then 'two'
  when 3 then 'three'
  when 4 then 'four'
  when 5 then 'five'
  when 6 then 'six'
  when 7 then 'seven'
  when 8 then 'eight'
  when 9 then 'nine'
  end
end
def teen_number_string(num)
  case num
  when 10 then 'ten'
  when 11 then 'eleven'
  when 12 then 'twelve'
  when 13 then 'thirteen'
  when 14 then 'fourteen'
  when 15 then 'fifteen'
  when 16 then 'sixteen'
  when 17 then 'seventeen'
  when 18 then 'eighteen'
  when 19 then 'nineteen'
  end
end
def ten_digit_string(digit)
  case digit
  when 1 then 'ten'
  when 2 then 'twenty'
  when 3 then 'thirty'
  when 4 then 'forty'
  when 5 then 'fifty'
  when 6 then 'sixty'
  when 7 then 'seventy'
  when 8 then 'eighty'
  when 9 then 'ninety'
  end
end
def number_string_99(number)
  case number
  when 0..9 then unit_digit_string(number)
  when 10..19 then teen_number_string(number)
  when 20..99
    unit_digit = number % 10
    ten_digit = (number - unit_digit) / 10
    ten_word = ten_digit_string(ten_digit)
    if unit_digit == 0
      ten_word
    else
      "#{ten_word}-#{unit_digit_string(unit_digit)}"
    end
  end
end

class BeerSong
  def initialize(number_of_bottles)
    @number_of_bottles = if number_of_bottles > 99
      99
    elsif number_of_bottles < 0
      0
    else
      number_of_bottles
    end
  end
  def number_string
    number_string_99(@number_of_bottles)
  end
  def bottle_word
    @number_of_bottles == 1 ? 'bottle' : 'bottles'
  end
  def print_stanza(number)
    number = number_string.capitalize
    puts "#{number} #{bottle_word} of beer on the wall,"
    puts "#{number} #{bottle_word} of beer,"
    puts "Take one down, pass it around,"
    @number_of_bottles -= 1
    puts "#{number_string.capitalize} #{bottle_word} of beer on the wall."
  end
  def print_song
    while @number_of_bottles > 0
      print_stanza @number_of_bottles
    end
  end
end

BeerSong.new(99).print_song
