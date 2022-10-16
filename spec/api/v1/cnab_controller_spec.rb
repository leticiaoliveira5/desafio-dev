require 'rails_helper'

describe Api::V1::CnabController, type: :request do
  let(:file) { fixture_file_upload('spec/fixtures/CNAB.txt', 'text/plain') }

  context 'parse_cnab' do
    it 'interpreta o arquivo e retorna os objetos criados' do
      post api_v1_parse_cnab_path, params: { file: file }, headers: { Accept: '*/*' }

      expect(JSON.parse(response.body)).to have_key('stores')
      expect(JSON.parse(response.body)['stores'][0]).to have_key('transactions')
      expect(response).to have_http_status(:created)
    end
  end
end
