class Api::V1::ArticlesController < Api::V1::ApiController
  def index
    articles = Article.all
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  def create
    article = current_user.articles.create!(article_params)
    render json: article
  end

  def update
    article = set_article_of_current_user
    article.update!(article_params)
    render json: article
  end

  def destroy
    article = set_article_of_current_user
    article.destroy!
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article_of_current_user
      current_user.articles.find(params[:id])
    end
end
