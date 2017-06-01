class Sentence
  #this is what could eventually be encoding and decoding. 
  #Not very compact but trying to play with OOP.
  #Each part is broken into small functions.
  def initialize(phrase)
    @phrase = phrase.split""
    @answer = ""
    @lower = ("a".."z").to_a
    @upper = ("A".."Z").to_a   
  end

  def answer
    puts @answer
  end

  def coding_parameters(shift)
    @encoded_lower = @lower.rotate(shift)
    @encoded_upper = @upper.rotate(shift)   
  end
  
  def encode_lower(letter)
    @answer << @encoded_lower[@lower.index(letter)]
  end

  def encode_upper(letter)
    @answer << @encoded_upper[@upper.index(letter)]
  end
  
  def letter?(letter)
    letter =~ /[[:alpha:]]/
  end

  def encode
    @phrase.each do |letter|
      if letter?(letter)
        if letter == letter.upcase
          self.encode_upper(letter)
        else
          self.encode_lower(letter)
        end
      else
        @answer << letter
      end
    end
    puts "Your sentence is: #{@answer}"
  end

end

puts "What sentence do you want to convert?"
sent = gets
trial = Sentence.new(sent)
puts "How much do you want to shift?"
shift = gets.to_i
trial.coding_parameters(shift)
trial.encode


