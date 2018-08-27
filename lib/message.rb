class Message
  attr_reader :text, :translator

  def initialize(message_text, translator)
    @text = message_text
    @translator = translator
  end

  def translation
    @translator.translate(@text)
  end
end
