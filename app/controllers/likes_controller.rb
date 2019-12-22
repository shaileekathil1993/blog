class LikesController < ApplicationController
	before_action :find_blog
	before_action :find_like, only: [:destroy]
  def create
    @blog.likes.create(user_id: current_user.id)
    redirect_to blog_path(@blog)
  end
  def destroy
	  if !(already_liked?)
	    flash[:notice] = "Cannot unlike"
	  else
	    @like.destroy
	  end
	  redirect_to blog_path(@blog)
	end
  private
  def find_blog
    @blog = Blog.find(params[:blog_id])
  end
  def find_like
	  @like = @blog.likes.find(params[:id])
	end
	def already_liked?
	  Like.where(user_id: current_user.id, blog_id: params[:blog_id]).exists?
	end
end
