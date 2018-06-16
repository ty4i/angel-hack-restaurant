def sign_up_chef
{
  "type": "richmenu",
  "altText": "シェフ情報登録",
  "template": {
      "type": "confirm",
      "text": "情報の登録を始めますか？",
      "actions": [
          {
              "type": "uri",
              "label": "Yes",
              "uri": "line://nv/location/"
          },
          {
            "type": "message",
            "label": "No",
            "text": "ヒントを使いませんでした"
          }
      ]
  }
}
end
