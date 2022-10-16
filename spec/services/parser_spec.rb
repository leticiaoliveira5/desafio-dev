require 'rails_helper'

RSpec.describe Parser, type: :service do
  let(:user) { create(:user) }
  let(:file) { fixture_file_upload('spec/fixtures/CNAB.txt', 'text/plain') }
  let(:parser) { described_class.new(file: file, current_user: user) }

  describe '#call' do
    it 'insere os dados nas tabelas loja e transação' do
      expect { parser.call }.to change(Transaction, :count).by(21)
        .and change(Store, :count).by(5)
        .and change(user.cnab_files, :count).by(1)
      expect(Transaction.first.type).to eq 'financing'
    end
  end

  describe '#valid?' do
    context 'quando o formato do arquivo é txt' do
      it { expect(parser.valid?).to be true }
    end

    context 'quando o formato do arquivo não é txt' do
      let(:file) { fixture_file_upload('spec/fixtures/img.png', 'image/png') }

      it { expect(parser.valid?).to be false }
    end

    context 'quando o arquivo está vazio' do
      let(:file) { fixture_file_upload('spec/fixtures/empty.txt', 'txt') }

      it { expect(parser.valid?).to be false }
    end
  end
end
