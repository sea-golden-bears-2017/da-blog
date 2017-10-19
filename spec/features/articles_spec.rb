require 'rails_helper'

RSpec.feature "Articles", type: :feature do
  let!(:article) { Article.create!({title: "ham", body: "hams plural great" }) }

  describe 'edit an article' do
    scenario 'can fill out a form and see the change on the page' do
      visit edit_article_path(article.id)
      title = "my new little title"

      fill_in "article[title]", with: title
      click_on "Update Article"
      expect(page).to have_content(title)
    end
  end

  describe 'create an article' do
    scenario 'can fill out a form and see the change on the page' do
      visit new_article_path
      title = "my new little title"
      body = "yay coffee, 16oz today"

      fill_in "article[title]", with: title
      fill_in "article[body]", with: body
      click_on "Create Article"
      expect(page).to have_content(title)
    end
  end

  describe 'navigate the index page' do
    scenario 'can click on the new article page' do
      visit articles_path
      click_on "make a new ham"
      expect(page).to have_content('new HAMS, or something')
    end
  end
end
