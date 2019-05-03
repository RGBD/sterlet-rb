require 'spec_helper'

RSpec.describe 'RawClient' do
  let(:raw_client) do
    Sterlet::RawClient.new('invalid_key')
  end

  it 'get_langs' do
    response = raw_client.get_langs(ui: :en)

    expect(response).to eq(read_fixture('response_get_langs_en'))
  end

  it 'detect' do
    response = raw_client.detect('london is a capital of great britain')

    expect(response).to eq(read_fixture('response_detect_en'))
  end

  it 'translate' do
    response = raw_client.translate('london is a capital of great britain', lang: 'en-ru')

    expect(response).to eq(read_fixture('response_translate_london_en_ru'))
  end
end
