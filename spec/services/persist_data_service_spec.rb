require 'rails_helper'

RSpec.describe PersistDataService, type: :service do
  let(:user) { create(:user) }
  let(:file) { fixture_file_upload('spec/fixtures/CNAB.txt', 'text/plain') }
  let(:data) { ParseFileService.new(file: file).call }
  let(:parser) { described_class.new(data: data, user: user) }

  describe '#call' do
    it 'insere os dados nas tabelas loja e transação' do
      expect { parser.call }.to change(Transaction, :count).by(21)
        .and change(Store, :count).by(5)
        .and change(user.cnab_files, :count).by(1)
      expect(Transaction.first.type).to eq 'financing'
    end
  end
end
