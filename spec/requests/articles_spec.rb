require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /api/v1/articles" do
    subject { get(api_v1_articles_path) }

    before do
      create_list(:article, 3)
    end

    it "記事の一覧が取得できる" do
      subject
      res = JSON.parse(response.body)

      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "body", "user"]
      expect(res[0]["user"].keys).to eq ["id", "name"]
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /api/v1/articles/:id" do
    subject { get(api_v1_article_path(article_id)) }

    describe "正常系のテスト" do
      context "指定したidの記事が存在する場合" do
        let(:article) { create(:article) }
        let(:article_id) { article.id }

        it "指定したidの記事が取得できる" do
          subject
          res = JSON.parse(response.body)

          expect(res["id"]).to eq article.id
          expect(res["title"]).to eq article.title
          expect(res["body"]).to eq article.body
          expect(res["user"]["id"]).to eq article.user.id
          expect(res["user"]["name"]).to eq article.user.name
          expect(response).to have_http_status(:ok)
        end
      end
    end

    describe "異常系のテスト" do
      context "指定したidの記事が存在しない場合" do
        let(:article_id) { 10000 }

        it "記事が見つからない" do
          expect { subject }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
