def is_matching?()
  {
    "type": "template",
    "altText": "マッチング可否判定",
    "template": {
      "type": "confirm",
      "text": "マッチングしますか？",
      "actions": [
        {
          "type": "postback",
          "label": "Yes",
          "data": "action=matching"
        },
        {
          "type": "message",
          "label": "No",
          "text": "大変残念ながらマッチングが成立しませんでした"
        }
      ]
    }
  }
end
