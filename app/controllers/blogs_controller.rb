class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blogs_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blogs = Blog.find(rarams[:id])
    @blogs.update(blogs_params)
    
    if @blogs.update(blogs_params)
      redirect_to blogs_path, notice: "ブログを更新しました！"
    else
      render :edit
    end
  end
  
  def destroy
    @blogs = Blog.find(params[:id])
    @blogs.destroy
    redirect_to blogs_path, notice: "ブログを削除しました"
  end
  
  def confirm
    @blogs = Blog.new(blogs_params)
    render :new if @blogs.invalid?
  end
  
  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end
    
    def set_blog
      @blogs = Blog.find(params[:id])
    end
end
