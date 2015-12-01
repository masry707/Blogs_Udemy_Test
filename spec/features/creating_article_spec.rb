require 'rails_helper'

RSpec.feature 'Creating article' do
  scenario 'A user creates an article' do
    visit '/'

    click_link 'New Article'

    fill_in 'Title', with: 'Creating first article'
    fill_in 'Body', with: 'Lorem Ipsum'

    click_button 'Create Article'

    expect(page).have_content('Article was created')
    expect(page.current_path).to eq(articles_path)

  end
end