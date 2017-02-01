class NewsController < ApplicationController
  def new
    @news = News.new
  end

  def create
    news = News.new(news_params)
    news.user_id = params[:user_id]
    news.save
    redirect_to root_path
  end

  def show
    @news = News.find(params[:id])
  end

  def destroy
    news = News.find(params[:id])
    news.destroy
    redirect_to root_path
  end

  private
    def news_params
      params.require(:news).permit(:body, :title)
    end

  def index
    @news = News.all
  end
end
