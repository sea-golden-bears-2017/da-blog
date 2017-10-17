require 'rails_helper'

describe Article, type: :model do
  let(:article) { Article.new(title: "ham", body: "burgler") }

  it 'has a title' do
    expect(article.title).to eq("ham")
  end
end
