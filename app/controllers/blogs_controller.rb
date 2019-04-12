class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
# show,edit,updateが実行される時だけ、その手前でset_blogメソッドが実行される。
  def index
    @blogs = Blog.all #インスタンス変数を定義することでビューにデータを渡すことができる

  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

# def create
#   Blog.create(blog_params)
#   redirect_to new_blog_path
#  end
#  このメソッドを下に書き換えた
#  createは一発でデータ保存するけれど、new→saveを挟むことで
#  条件付けができて、バリデーションを実行できるようになる。

 def create
    @blog = Blog.new(blog_params)
    if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "ブログを作成しました！" #　blogs_pathにより、indexにとぶ
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end


def edit
  # @blog = Blog.find(params[:id]) #　←set_blog関数によって省略できるようになった。
end


 def show  #画面を参照するところ
   # @blog = Blog.find(params[:id]) #送られてきたリクエストのパラメータからidを取得できる。
  end


  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy #取得した値をデストロイ(削除)する
     redirect_to blogs_path, notice:"ブログを削除しました！"
     # blogs GET /blogs(.:format) blogs#index
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

 private

 def blog_params
    params.require(:blog).permit(:title, :content)
  end

  # idをキーとして値を取得するメソッド
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
