class BooksController < ApplicationController
  def index
    # インスタンス変数bookにBookモデルの情報をもとにnewメソッドでで作成されたオブジェクトを格納
    @book = Book.new
    # インスタンス変数booksにBookモデルとやり取りしているテーブルに保存されているすべてのレコードをallメソッドでまとめて取得し、格納
    @books = Book.all
    
  end
  
  def create
    # 下記で抽出したデータをBookモデルのnewメソッドの引数に指定し新しいインスタンスを作成。
    # 画面に表示しないためローカル変数に
    book = Book.new(book_params)
    # 上述のローカル変数book内のBookモデルのインスタンスをここでデータベースに保存
    book.save
    # 処理の最後に画面を遷移　
    redirect_to "/books/#{book.id}"
  end

  def show
    # インスタンス変数bookにBookモデルからfindメソッドを用いてparamsが受け取ったidのレコードを取得する
    @book = Book.find(params[:id])
  end

  def edit
    # paramsが受け取ったIDのレコード情報をfindメソッドを用いてBookモデルと紐づいたテーブルから取得
    @book = Book.find(params[:id])
  end
  
  def update  
    # ローカル変数bookにparamsが受け取ったIDをもとにfindメソッドを用いて取得したレコードを代入)
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to "books/#{book.id}"
  end
  
  def destroy
  end
  
  private
  # ストロングパラメータ 
  def book_params
    # フォームから送られてきたデータはparamsに格納
    # requireメソッドは送られてきたデータをbookモデルを指定し、データを絞り込む
    # permitメソッドで絞り込んだデータから保存を許可するカラムを指定
    params.require(:book).permit(:title, :body)
  end
end 



 
 
