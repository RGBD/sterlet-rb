require 'spec_helper'

RSpec.describe 'Client' do
  let(:client) do
    Sterlet::Client.new('invalid_key')
  end

  it '#dirs' do
    response = client.dirs

    expected_response = [
      %i[en fr],
      %i[en ru],
      %i[fr en],
      %i[fr ru],
      %i[ru en],
      %i[ru fr],
    ]
    expect(response).to eq(expected_response)
  end

  it '#langs' do
    response = client.langs

    expected_response = {
      en: 'English',
      fr: 'French',
      ru: 'Russian',
    }
    expect(response).to eq(expected_response)
  end

  it '#detect' do
    response = client.detect('london is a capital of great britain')

    expect(response).to eq(:en)
  end

  it '#detect unknown' do
    response = client.detect('42')

    expect(response).to be_nil
  end

  it '#translate' do
    response = client.translate('london is a capital of great britain', from: 'en', to: 'ru')

    expect(response).to eq('Лондон-столица Великобритании')
  end
end
