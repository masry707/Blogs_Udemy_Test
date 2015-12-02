require 'rails_helper'

RSpec.feature 'Deleting an Article' do
  before do
    @article = Article.create(title: 'first article', body: 'body of first article')
  end

  scenario 'user deletes article' do
    visit '/'

    click_link @article.title

    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end
end