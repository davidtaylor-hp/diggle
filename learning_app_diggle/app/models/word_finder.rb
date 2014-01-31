class WordFinder
  def self.lookup(word)
    real_word = WebServices::DiggleDictionary.look_up(word)
    return if real_word[:definitions].empty?

    Entry.create!(word: real_word[:word]).tap do |a|
      real_word[:definitions].each do |defin|
        a.definitions.create(text: defin)
      end
      end
    end
  end
