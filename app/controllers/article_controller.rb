class ArticleController < ApplicationController
  before_action:authenticate_customer!

  def home
  end



  def show
    #byebug
    @article=Article.find(params[:id])
  end


  def index
    #@article=Article.all()
    @articles=Article.paginate(page: params[:page], per_page: 3)
  end

  def search
    @article=Article.where("title LIKE?","%"+params[:q]+"%")
  end  

  def new

  end  

  def create
    #byebug
    @article=Article.new(params.require(:article).permit(:title,:description,:user_id))
    @article.save()
    
    redirect_to article_index_path
  end  

  def edit
    @article=Article.find(params[:id])#if this line is not there it will show form with no data otherwise form data with respctive given id
    
  end  


  def update
    @article=Article.find(params[:id])#old data
    @article.update(params.require(:article).permit(:title,:description))#new data
    @article.save()

    redirect_to action:"index"
  end


  def destroy
    @article=Article.find(params[:id])
    @article.delete()
    redirect_to article_index_path
  end




end
