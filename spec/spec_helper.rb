require 'webmock/rspec'

require 'sterlet'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  def read_fixture(name)
    JSON.parse(File.read("spec/fixtures/#{name}.json"))
  end

  config.before(:each) do
    stub_config = {
      'getLangs' => 'get_langs_en',
      'detect' => 'detect_en',
      'translate' => 'translate_london_en_ru',
    }
    stub_config.each do |endpoint, fixture|
      stub_request(:post, %r{#{Sterlet::API_URI_BASE}/#{endpoint}})
        .with(body: read_fixture("request_#{fixture}"))
        .to_return(status: 200, body: JSON.dump(read_fixture("response_#{fixture}")))
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
