class CommentsController < ApplicationController
before_filter :login_required, :only=>['destroy']

def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    redirect_to :controller => "articles", :action => "index"
    return false
  end

def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.create(comment_params)
  redirect_to article_path(article)
end

def destroy
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
  @comment.destroy
  redirect_to article_path(@article)
end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
