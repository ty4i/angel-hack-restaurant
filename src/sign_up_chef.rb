def sign_up_chef
{
  "type": "template",
  "altText": "シェフ情報登録",
  "template": {
      "type": "confirm",
      "text": "シェフ情報の登録を開始します",
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
