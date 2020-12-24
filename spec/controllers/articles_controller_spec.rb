require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  let(:valid_attributes) {
    {
      title: 'test title',
      content: 'test content',
      activated: true
    }
  }
  let(:invalid_attributes) {
    {
      title: '',
      content: 'test content',
      activated: true
    }
  }
  let(:valid_session) { {} }
  describe "PATCH #switch_activated" do
    context "with valid params" do
      let(:new_attributes) {
        {
          activated: true
        }
      }
      it "switch activated the requested article" do
        article = Article.create! valid_attributes
        patch(:switch_activated, params:
          {
            id: article.id,
            article: new_attributes
          },
          session: valid_session
        )
        article.reload
        expect(article.activated).not_to (   
        eq(valid_attributes[:activated])
        )
        expect(flash[:notice]).to be_present
      end
      it "redirects to the articles index" do
        article = Article.create! valid_attributes
        patch(:switch_activated, params:
          {
            id: article.id,
            article: new_attributes
          },
          session: valid_session
        )
        expect(response).to redirect_to(articles_path)
      end
    end
  end
end