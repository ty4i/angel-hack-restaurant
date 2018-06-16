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
            "data": "chef_sign_up_flag=yes"
          },
          {
            "type": "postback",
            "label": "No",
            "data": "chef_sign_up_flag=no",
          }
        ]
      }
    }
  ]
end

def chef_description
    {
      type: 'text',
      text: "シェフ情報の登録を行います"
    },
    {
      "type": "template"
      "altText": "シェフ経験入力中",
      "template": {
        "type": :
      }
&text=#{text}
    }
end
