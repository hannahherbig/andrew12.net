require 'albino'

class Mustache
  def code
    lambda do |text|
      lang, text = text.split("\n", 2)

      Albino.colorize(text, lang)
    end
  end
end
