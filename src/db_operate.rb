def get_db_connection()
    host = "ec2-23-23-130-158.compute-1.amazonaws.com"
    user = "gbxjlwqbohlpnu"
    password = "419ce16174c6ff94251c080e7e54f026ea4cdb8b90ea49f7d96628aff3b42440"
    dbname = "d9d142j62mi3lm"
    port = "5432"
    return PG::connect(:host => host, :user => user, :password => password, :dbname => dbname, :port => port)
end

# サンプルテーブルにデータを追加する関数
def test(tes)
  begin
    # connection を使い PostgreSQL を操作する
    result = get_db_connection().exec("INSERT INTO sample (username, email) VALUES($1, $2)", [tes, tes])
  ensure
    # データベースへのコネクションを切断する
    connection.finish
  end
end

# シェフの情報を登録
def register()
