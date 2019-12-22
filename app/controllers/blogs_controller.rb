class BlogsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
	def index
    @blogs = Blog.all
  end

	def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end
   
  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
   
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end
 
  def update
    @blog = Blog.find(params[:id])
   
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
 
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :image)
  end
end
