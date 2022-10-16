require 'rails_helper'

describe 'User deletes cnab file', type: :feature do
  let(:user) { create(:user) }
  let(:cnab_file) { create(:cnab_file, user: user) }

  scenario 'successfully' do
    sign_in(user)

    visit root_path
    click_on "Arquivo ##{cnab_file.id}"

    expect(current_path).to eq cnab_file_path(cnab_file)

    click_on 'Excluir'

    expect(current_path).to eq root_path
    expect(page).to have_text 'Arquivo removido'
    expect(page).not_to have_content "Arquivo ##{cnab_file.id}"
  end
end
