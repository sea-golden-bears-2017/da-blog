require 'rails_helper'

describe ArticlesController, type: :controller do
  describe "#create" do
    let(:article_params) { {title: "ham", body: "hams plural great" } }

    it 'redirects to the article_path' do
      post :create, params: { article: article_params }
      expect(response).to redirect_to(article_path(Article.last))
    end

    it 'adds a new article to the database' do
      expect {post :create, params: { article: article_params }}.to change { Article.all.length }.by(1)
    end
  end

  describe "#show" do
    let!(:article) { Article.create!({title: "ham", body: "hams plural great" }) }

    it 'assigns the @article instance variable' do
      get :show, params: {id: article.id}
      expect(assigns[:article]).to eq(article)
    end
  end
end
