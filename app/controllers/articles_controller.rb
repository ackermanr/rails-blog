class ArticlesController < ApplicationController

before_filter :login_required, :only=>['new', 'update', 'edit', 'destroy']

def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    redirect_to :controller => "articles", :action => "index"
    return false 
  end

def new
  @article = Article.new
end

def show
  @article = Article.find(params[:id])
end

def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def index
  @articles = Article.all.paginate(:page => params[:page], :per_page => 1).order('created_at DESC')
end

def contents
  @articles = Article.all
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
