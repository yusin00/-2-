class BooksController < ApplicationController



  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to'/books'
  end

    def create
      #1.%2.データを受け取り新規登録するためのインスタンス作成
      @book=Book.new(book_params)
      #3. データをデータベースに保存するためのsave  メソッド実行
      if @book.save
          # 詳細画面へリダイレクト
         #3. フラッシュメッセージを定義し、詳細画面へリダイレクト
       flash[:notice]="Book was successfully created."
        redirect_to book_path(@book.id)
      else
         @books=Book.all
        #３　フラッシュメッセージを定義し、new,html.erbを描画する
        flash.now[:alert]="error prohibited this book from being saved:"
      render:index
      end
    end

  def index
    @books=Book.all
    @book = Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
          # 詳細画面へリダイレクト
         #3. フラッシュメッセージを定義し、詳細画面へリダイレクト
       flash[:notice]="Book was successfully created."
        redirect_to book_path(@book.id)
      else
        #３　フラッシュメッセージを定義し、new,html.erbを描画する
      render:edit
      end
  end
  private
  #ストロングパラメータ
  def book_params
  params.require(:book).permit(:title, :body, :image)
  end
end
