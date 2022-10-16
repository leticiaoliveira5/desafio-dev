require 'rails_helper'

RSpec.describe ParseFileService, type: :service do
  let(:file) { fixture_file_upload('spec/fixtures/CNAB.txt', 'text/plain') }
  let(:parser) { described_class.new(file: file) }

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
