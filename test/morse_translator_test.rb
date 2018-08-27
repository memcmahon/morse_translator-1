require 'minitest/autorun'
require 'minitest/pride'
require './lib/morse_translator'
require 'pry'

class MorseTranslatorTest < Minitest::Test
  def test_it_exists
    morse_translator = MorseTranslator.new

    assert_instance_of MorseTranslator, morse_translator
  end

  def test_it_can_translate_a_single_letter
    morse_translator = MorseTranslator.new

    assert_equal ".-", morse_translator.translate("a")
  end

  def test_it_can_translate_multiple_characters
    morse_translator = MorseTranslator.new

    assert_equal ".--...", morse_translator.translate("ab")
  end

  def test_it_can_translate_spaces
    morse_translator = MorseTranslator.new
    expected = "......-...-..--- .-----.-..-..-.."

    assert_equal expected, morse_translator.translate("hello world")
  end

  def test_it_can_handle_upper_case_letters
    morse_translator = MorseTranslator.new
    expected = "......-...-..--- .-----.-..-..-.."

    assert_equal expected, morse_translator.translate("Hello World")
  end

  def test_it_can_translate_numbers
    morse_translator = MorseTranslator.new
    expected = "-......-.. .-.-.. ...-- ..........--...."

    assert_equal expected, morse_translator.translate("There are 3 ships")
  end

  def test_it_can_get_lower_case_characters
    morse_translator = MorseTranslator.new

    assert_equal ["a", "3", " ", "b"], morse_translator.lower_case_characters("A3 b")
  end

  def test_it_can_translate_from_morse_to_text
    morse_translator = MorseTranslator.new
    actual = morse_translator.morse_to_eng(".... . .-.. .-.. ---  .-- --- .-. .-.. -..")

    assert_equal "hello world", actual
  end

  def test_it_can_translate_a_morse_word
    morse_translator = MorseTranslator.new

    actual = morse_translator.morse_word_to_eng(".... . .-.. .-.. ---")
    assert_equal "hello", actual
  end
end
