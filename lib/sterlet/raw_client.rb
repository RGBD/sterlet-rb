module Sterlet
  class RawClient
    def initialize(api_key)
      @api_key = api_key
    end

    # rubocop:disable Naming/UncommunicativeMethodParamName
    def get_langs(ui: :en)
      perform_post_request('/getLangs', ui: ui)
    end
    # rubocop:enable Naming/UncommunicativeMethodParamName

    def detect(text, hints: [])
      perform_post_request('/detect', text: text, hints: hints)
    end

    def translate(text, lang:, format: :plain, options: 0)
      params = { text: text, lang: lang, format: format, options: options }
      perform_post_request('/translate', params)
    end

    private

    def default_params
      { key: @api_key }
    end

    def perform_post_request(endpoint, params)
      response =
        HTTP.post(API_URI_BASE + endpoint, form: default_params.merge(params))
      return JSON.parse(response.to_s) if response.code == 200

      raise Error, JSON.parse(response.to_s)['message']
    end
  end
end
