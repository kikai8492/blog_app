class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    return render :new if params[:back]

    if @blog.save
      redirect_to  blog_path(@blog), notice:"投稿しました"
    else
      render :new
    end

  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました"
    else
      render :edit
    end
  end

  def update
    @blog = Blog.find(params[:id])
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?

  end

  def destroy
    @blogs = Blog.find(params[:id])
    @blog.destroy
    redirect_to blog_path, notice:"削除しました"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
