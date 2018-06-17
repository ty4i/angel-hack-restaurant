def sign_up_chef(text)
  [
    {
      type: 'text',
      text: "シェフ情報の登録を行います"
    },
    {
      "type": "template",
      "altText": "シェフ登録選択中",
      "template": {
        "type": "confirm",
        "text": "情報の登録を行いますか？",
        "actions": [
          {
            "type": "postback",
            "label": "Yes",
          #  "data": "chef_sign_up_flag=yes"
             "data": "yes_test"
          },
          {
            "type": "postback",
            "label": "No",
            #"data": "chef_sign_up_flag=no",
            "data": "no_test"
          }
        ]
      }
    }
  ]
end

def register_chef
  [
    {
      type: 'text',
      text: '登録を完了しました'
    }
  ]
end

def chef_description
    {
      type: 'text',
      text: "シェフ情報の登録を行います\n名前，アピールポイント，興味のあるカテゴリ，希望の時間帯を入力してください"
    }
#    ,
   # {
   #   "type": "template"
   #  "altText": "シェフ経験入力中",
   # "template": {
    #    "type":
    #  }
#&text=#{text}
 #   }
end
