require './test/setup'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_a_character_set
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.character_set
  end

  def test_generate_keys
    assert_instance_of String, @enigma.generate_keys
    assert_equal 5, @enigma.generate_keys.length
  end

  def test_get_date
    assert_instance_of String, @enigma.get_date
    assert_equal 6, @enigma.get_date.length
  end

  def test_generate_offsets
    @enigma.stubs(:get_date).returns("040895")
    date = @enigma.get_date

    assert_instance_of String, @enigma.generate_offsets(date)
    assert_equal "1025", @enigma.generate_offsets(date)
  end

  def test_it_can_find_shifts
    @enigma.stubs(:generate_keys).returns("02715")
    @enigma.stubs(:get_date).returns("040895")
    expected = {
      :keys => "02715",
      :date => "040895",
      :A => 3,
      :B => 27,
      :C => 73,
      :D => 20
    }

    assert_instance_of Hash, @enigma.find_shifts
    assert_equal expected, @enigma.find_shifts
  end

  def test_encode
    assert_equal "k", @enigma.encode("h", 3)
    assert_equal "!", @enigma.encode("!", 2)
    assert_equal "?", @enigma.encode("?", 15)
  end

  def test_encrypt
    @enigma.stubs(:generate_keys).returns("02715")
    @enigma.stubs(:get_date).returns("040895")

    actual = @enigma.encrypt("HELLO WORLD!")

    assert_instance_of Hash, actual
    assert_equal "keder ohulw!", actual[:encryption]
    assert_equal "02715", actual[:key]
    assert_equal "040895", actual[:date]
  end

  def test_decrypt
    @enigma.stubs(:generate_keys).returns("02715")
    @enigma.stubs(:get_date).returns("040895")

    actual = @enigma.decrypt("keder ohulw!")

    assert_instance_of Hash, actual
    assert_equal "hello world!", actual[:decryption]
    assert_equal "02715", actual[:key]
    assert_equal "040895", actual[:date]
  end
end
