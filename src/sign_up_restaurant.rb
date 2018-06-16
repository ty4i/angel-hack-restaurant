def sign_up_restaurant
{
  "type": "template",
  "altText": "店舗情報登録",
  "template": {
      "type": "confirm",
      "text": "店舗情報の登録を開始します",
      "actions": [
          {
            "type": "message",
            "label": "はい",
            "text": "はい"
          },
          {
            "type": "message",
            "label": "キャンセル",
            "text": "キャンセル"
          }
      ]
  }
}
end
