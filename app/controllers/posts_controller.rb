class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    posts = Post.all
    render json: posts
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    post = Post.create(post_params)
    if post
      render json: post, status: :created
    else
      render json: {error: "Failed to create post"}
    end
  end
  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      render json: post, status: :ok
    else
      render json: { error: "Failed to update post" }, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    post = Post.find_by(id: params[:id])
    if post
      post.destroy
      head :no_content
    else
      render json: {error: "Failed to delete"}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:title, :description, :image)
    end
end
