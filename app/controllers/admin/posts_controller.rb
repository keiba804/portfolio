class Admin::PostsController < ApplicationController
  before_action :authenticate_restaurant!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  PER = 5
  # GET /posts
  # GET /posts.json
  def index
    @posts = current_restaurant.posts.order(created_at: :desc).page(params[:page]).per(PER)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.restaurant_id = current_restaurant.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_path(@post), notice: 'インフォメーションを作成しました.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_post_path(@post), notice: 'インフォメーションを編集しました.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    post = Post.find(params[:id])
    post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_path(current_restaurant), notice: 'インフォメーションを削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:restaurant_id, :post_title, :post_body, :post_image_id)
    end
end
