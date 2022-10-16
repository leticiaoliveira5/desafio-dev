require 'rails_helper'

describe Api::V1::CnabController, type: :request do
  let(:file) { fixture_file_upload('spec/fixtures/CNAB.txt', 'text/plain') }

  context 'o arquivo é válido' do
    it 'interpreta o arquivo e retorna os objetos criados' do
      post api_v1_parse_cnab_path, params: { file: file }, headers: { Accept: '*/*' }

      expect(JSON.parse(response.body)).to have_key('stores')
      expect(JSON.parse(response.body)['stores'][0]).to have_key('transactions')
      expect(response).to have_http_status(:created)
    end
  end

  context 'o arquivo não tem um formato válido' do
    let(:file) { fixture_file_upload('spec/fixtures/img.png', 'image/png') }

    it 'retorna mensagem de erro' do
      post api_v1_parse_cnab_path, params: { file: file }, headers: { Accept: '*/*' }

      expect(JSON.parse(response.body)['error']).to include 'The file could not be parsed'
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'o arquivo não é um cnab válido' do
    let(:file) { fixture_file_upload('spec/fixtures/CNAB-invalid.txt', 'text/plain') }

    it 'retorna mensagem de erro' do
      post api_v1_parse_cnab_path, params: { file: file }, headers: { Accept: '*/*' }

      expect(JSON.parse(response.body)['error']).to include 'The file could not be parsed'
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
