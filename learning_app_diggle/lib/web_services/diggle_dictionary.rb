
class WebServices::DiggleDictionary

  def self.look_up(word)
    response = find_word(word)
    { word: word, definitions: parse_definitions(response) }
  end

  private

  def self.find_word(word)
    connection.get(word) do |req|
      req.params['key'] = "cab72891-f003-43ef-a983-253666d45082"
        end.tap do |response|
      raise_error if response.status != 200
    end
  rescue Faraday::Error::ClientError
    raise_error
  end

  def self.parse_definitions(response)
    doc = Nokogiri.parse(response.body)
    doc.xpath('//dt').map { |node| node.children.first.text.gsub(':', '').strip }.reject(&:empty?)
  end

  def self.connection
    Faraday.new(url: URI.parse("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/").to_s) do |faraday|
    faraday.adapter Faraday.default_adapter
  end
end
