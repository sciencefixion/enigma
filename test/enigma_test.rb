require './test/setup'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_random_five_digit_num
    assert_equal 5, @enigma.random_five_digit_num.length
  end

  def test_generate_keys
    
    assert_instance_of Hash, @enigma.generate_keys
    assert_equal 4, @enigma.generate_keys.length
  end

  def test_generate_offsets
    skip
  end

end
