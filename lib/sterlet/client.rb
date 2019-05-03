module Sterlet
  class Client
    def initialize(api_key)
      @raw_client = RawClient.new(api_key)
    end

    def detect(text, hints: [])
      response = @raw_client.detect(text, hints: hints)
      response['lang'].to_sym
    end

    def translate(text, to:, from: nil, format: :plain)
      lang = from ? [from, to].join('-') : to
      response = @raw_client.translate(text, lang: lang, format: format)
      response['text'].join(' ')
    end

    def dirs
      @raw_client.get_langs['dirs'].map { |x| x.split('-').map(&:to_sym) }
    end

    # rubocop:disable Naming/UncommunicativeMethodParamName
    def langs(ui: :en)
      @raw_client.get_langs(ui: ui)['langs'].map { |k, v| [k.to_sym, v] }.to_h.freeze
    end
    # rubocop:enable Naming/UncommunicativeMethodParamName
  end
end
