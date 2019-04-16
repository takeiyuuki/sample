class ContactsController < ApplicationController
  def index
  end


  def new
     @contact = Contact.new #ビューにデータを渡す
     # モデルを作ってない状態だったのでエラーが起きていた。
  end

  def create
     # Contact.create(name: params[:contact][:name], email: params[:contact][:email], content: params[:contact][:content]) # モデルにDB操作の命令を出す
     @contact = Contact.create(contact_params)
     if @contact.save
    redirect_to new_contact_path, notice:"ブログを作成しました！"
  else
    render 'new'
  end
end
  private

  def contact_params
     params.require(:contact).permit(:name, :email, :content)
   end
end
