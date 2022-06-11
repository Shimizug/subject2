class BooksController < ApplicationController
  def index
    # インスタンス変数bookにBookモデルの情報をもとにnewメソッドでで作成されたオブジェクトを格納
    @book = Book.new
    # インスタンス変数booksにBookモデルとやり取りしているテーブルに保存されているすべてのレコードをallメソッドでまとめて取得し、格納
    @books = Book.all
    
  end
  
  def create
    # 下記で抽出したデータをBookモデルのnewメソッドの引数に指定し新しいインスタンスを作成。
    @book = Book.new(book_params)
    # 上述のローカル変数book内のBookモデルのインスタンスをここでデータベースに保存
    # バリデーションの設定、saveメソッドに成功すれば詳細ページに飛ぶように
    if @book.save
    # 成功したら画面を遷移　
      redirect_to "/books/#{@book.id}", notice: 'Book was successfully created.'
    # 失敗したらもう一度index画面を表示
    else 
      @books = Book.all
      render :index
    end
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to "/books/#{@book.id}", notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books",  notice: 'Book was successfully destroyed.'
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



 
 
