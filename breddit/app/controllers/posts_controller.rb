class PostsController < ApplicationController
before_action :set_post, only: [:show, :edit, :update, :destroy]

def set_post
  @post = Post.find(params[:id])
end

def upvote
  @posts = Post.find(params[:id])
  @posts.votes.create
  redirect_to(posts_path)
end

def downvote
  @posts = Post.find(params[:id])
  @posts.votes.last.destroy
  redirect_to(posts_path)
end


  def index
      unorganized_list_of_posts = Post.all
      @posts = unorganized_list_of_posts.sort_by{|post| -post.votes.count }
  end

  def edit
  end

  def show
    @posts = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end


  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def post_params
    params.require(:post).permit(:name, :description)

  end

end
