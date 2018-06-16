def get_db_connection()
    host = "ec2-23-23-130-158.compute-1.amazonaws.com"
    user = "gbxjlwqbohlpnu"
    password = "419ce16174c6ff94251c080e7e54f026ea4cdb8b90ea49f7d96628aff3b42440"
    dbname = "d9d142j62mi3lm"
    port = "5432"
    return PG::connect(:host => host, :user => user, :password => password, :dbname => dbname, :port => port)
end

# シェフの情報を登録(初期登録)
def sign_up_chef(args)
  begin
    result = get_db_connection().exec("INSERT INTO chef_table (id, description, category, time) VALUES($1, $2, $3, $4)", args)
  ensure
    connection.finish
  end
end

#レストランの情報を登録(初期登録)

def sign_up_restaurant(args)
  begin
    result = get_db_connection().exec("INSERT INTO chef_table (id, facility, prohibit, floor, time) VALUES($1, $2, $3, $4, $5)", args)
  ensure
    connection.finish
  end
end

# 店側がフリーのシェフを検索(検索結果の一覧を取得、引数は、写真に登録されている料理名)
def search_chef(args)
  begin
    result = get_db_connection().exec("SELECT * FROM picture WHERE LIKE %$1%", args)
    # 返り値は以下の感じでループで回して取得する
    # result.each do |tuple|
    #   puts tuple['value1']
    #   puts tuple['value2']
    # end
    return result
  ensure
    connection.finish
  end
end


# 写真一覧からクリックした一人のシェフについて「詳細情報」を取得
def show_chef_detail(args)
  begin
    result = get_db_connection().exec("SELECT * FROM picture WHERE id = $1", args)
    return result
  ensure
    connection.finish
  end
end
