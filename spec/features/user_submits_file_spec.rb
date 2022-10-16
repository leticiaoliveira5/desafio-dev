require 'rails_helper'

describe 'User submits file to be parsed', type: :feature do
  let(:user) { create(:user) }
  let(:file) { Rails.root.join('spec/fixtures/CNAB.txt') }

  scenario 'successfully' do
    sign_in(user)

    visit root_path
    page.attach_file('file', file)
    click_on :commit

    expect(current_path).to eq cnab_file_path(CnabFile.last)
    expect(page).to have_text('Arquivo')
    expect(page).to have_link('Excluir')
    expect(page).to have_link('Página Inicial')
  end
end
