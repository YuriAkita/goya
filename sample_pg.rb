# pgライブラリを使用する
require 'pg'
# PG::connect(dbname: "goya")により、rubyからgoyaDBに接続し
# 接続したという情報をconnectionという名前の変数に格納する
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select weight, give_for from crops;"
  # のSQLの命令文を直接実行し、その結果をresult変数に格納する
  result = connection.exec("select weight, give_for from crops;")
  # 取り出した各行を処理する
  result.each do |record|
      # 各行を取り出し、putsでターミナル上に出力する
      puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}"
  end

  result_2 = connection.exec("SELECT * FROM crops WHERE quality = false;")
  # 取り出した各行を処理する
  quality_result.each do |record_2|
      # 各行を取り出し、putsでターミナル上に出力する
      puts "ゴーヤの長さ：#{record_2["length"]}　ゴーヤの大きさ：#{record_2["weight"]}　ゴーヤの品質：#{record_2["quality"]}　
      売った相手：#{record_2["give_for"]}　年月日：#{record_2["date"]}"
  end

  result_3 = connection.exec("SELECT * FROM crops WHERE give_for != '自家消費';")
  # 取り出した各行を処理する
  result_3.each do |record_3|
      # 各行を取り出し、putsでターミナル上に出力する
      puts "ゴーヤの長さ：#{record_3["length"]}　ゴーヤの重さ：#{record_3["weight"]}　ゴーヤの品質：#{record_3["quality"]}　
      売った相手：#{record_3["give_for"]}　年月日：#{record_3["date"]}"
  end

ensure
  # 最後に.finishでデータベースへのコネクションを切断する
  connection.finish
end
