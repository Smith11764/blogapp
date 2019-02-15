class ArticlesController < ApplicationController

before_action :move_to_index, except: :index

def index
  @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
end

def new
  @article = Article.new
end

def create
  @article = Article.new(image: article_params[:image], Frame: article_params[:Frame], Wheel: article_params[:Wheel],FD: article_params[:FD],RD: article_params[:RD],Crank_Set: article_params[:Crank_Sret],Brake: article_params[:Brake], Handle: article_params[:Handle],Stem: article_params[:Stem],user_id: current_user.id)
  @article.save
  redirect_to root_path
end

def destroy
  article = Article.find(params[:id])
    article.destroy if article.user_id == current_user.id
end

def edit
  @article = Article.find(params[:id])
end

def update
  article = Article.find(params[:id])
  article.update(article_params) if article.user_id == current_user.id
  redirect_to root_path
end

def show
  @tweet = Tweet.find(params[:id])
  @comments = @tweet.comments.includes(:user)
end

private
def article_params
  params.require(:article).permit(:image, :text, :Frame, :Wheel, :FD, :RD, :Crank_set, :Brake, :Handle, :Stem)
end

def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end
