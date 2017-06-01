# given a string, return the character after every letter "r"
#
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
  out_string = ""
  prev_char = ""
  string.each_char do |char|
    if prev_char == "r" || prev_char == "R"
      out_string << char
    end
    prev_char = char
  end
  out_string
end
