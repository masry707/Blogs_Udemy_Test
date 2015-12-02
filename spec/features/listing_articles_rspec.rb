require 'rails_helper'

RSpec.feature 'Listing Articles' do

  before do
    @article1 = Article.create(title: 'The first Article', body: 'Body of the first article')
    @article2 = Article.create(title: 'The second Article', body: 'Body of the second article')
  end

  scenario 'List all articles' do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end