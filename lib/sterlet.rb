require 'json'
require 'http'

require 'sterlet/version'
require 'sterlet/errors'
require 'sterlet/raw_client'
require 'sterlet/client'

module Sterlet
  API_URI_BASE = 'https://translate.yandex.net/api/v1.5/tr.json'.freeze
end
