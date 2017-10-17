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

  context 'with an article' do
    let!(:article) { Article.create!({title: "ham", body: "hams plural great" }) }

    describe "#show" do
      it 'assigns the @article instance variable' do
        get :show, params: {id: article.id}
        expect(assigns[:article]).to eq(article)
      end
    end

    describe '#edit' do
      before(:each) do
        get :edit, params: {id: article.id}
      end

      it 'responds with a 200 status code' do
        expect(response.status).to eq(200)
      end

      it 'renders the edit view' do
        expect(response).to render_template(:edit)
      end

      it 'assigns the @article instance variable'
    end
  end
end
