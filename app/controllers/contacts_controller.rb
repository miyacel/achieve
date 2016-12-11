class ContactsController < ApplicationController
  
  def index
  end
  
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      # お問い合わせありがとうございました！"とメッセージを表示します。
    redirect_to root_path, notice: "お問い合わせありがとうございました！"
    else
      # 入力フォームを再描画します。
      render action: 'new'
    end
  end
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
