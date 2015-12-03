require 'rails_helper'

RSpec.feature 'Editing an article' do

  before do
    @john = User.create!(email: 'john@example.com', password: 'password')
    login_as(@john)
    @article = Article.create(title: 'first article', body: 'body of first article', user: @john)
  end

  scenario 'User updates an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: 'updated article title'
    fill_in 'Body', with: 'updated article body'

    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'User fails to update an article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'updated article body'

    click_button 'Update Article'

    expect(page).to have_content('Article has not been updated')
    expect(current_path).to eq(article_path(@article))
  end
end