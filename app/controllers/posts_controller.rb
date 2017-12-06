class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    def index
    @posts = Post.all
    end
    def update
    if  @post.update
    redirect_to @post
    else
    render 'edit'
    end
    def edit
    end
    def destroy
    @post.destroy
    redirect_to root_path
    end
    def show
    end
    def new
    @post = Post.new
    end
    def create
    @post = Post.create!(post_params)
    if @post.save
    redirect_to @post
    else
    render 'new'
    end
   end

   private

   def find_post
     @post = Post.find(params[:id])
   end
    def post_params
     params.require(:post).permit(:title, :content)
   end
end
