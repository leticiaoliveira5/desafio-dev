require 'rails_helper'

describe 'User submits file', type: :feature do
  let(:user) { create(:user) }
  let(:file) { Rails.root + 'spec/fixtures/CNAB.txt' }

  scenario 'successfully' do
    sign_in(user)

    visit root_path
    page.attach_file('file', file)
    click_on :submit

    expect(current_path).to eq cnab_file_path(CnabFile.last)
    expect(current_path).to have_content('Arquivo')
  end
end
