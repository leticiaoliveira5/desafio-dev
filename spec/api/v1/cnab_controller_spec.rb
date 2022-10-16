require 'rails_helper'

describe Api::V1::CnabController, type: :request do
  let(:file) { fixture_file_upload('spec/fixtures/CNAB.txt', 'text/plain') }

  context 'parse_cnab' do
    it 'interpreta o arquivo e retorna os objetos criados' do
      params = { file: file, format: 'json' }
      headers = { 'Content-Type': 'text/plain' }

      post api_v1_parse_cnab_path(params), headers: headers

      expect(response).to have_http_status(:created)
    end
  end
end
