class ContactsController < ApplicationController
  def index
  end


  def new
     @contact = Contact.new #ビューにデータを渡す
     # モデルを作ってない状態だったのでエラーが起きていた。
  end

  def create
    Contact.create(name: params[:contact][:name], email: params[:contact][:email], content: params[:contact][:content]) # モデルにDB操作の命令を出す
    redirect_to new_contact_path
  end
end
