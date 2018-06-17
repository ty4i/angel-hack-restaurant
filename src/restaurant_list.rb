def restaurant_list
  {
    "type": "template",
    "altText": "店舗一覧",
    "template": {
      "type": "image_carousel",
      "columns": [
        {
          "imageUrl": "https://example.com/bot/images/item2.jpg",
          "action": {
            "type": "message",
            "label": "Yes",
            "text": "yes"
          }
        },
        {
          "imageUrl": "https://example.com/bot/images/item2.jpg",
          "action": {
            "type": "message",
            "label": "Yes",
            "text": "yes"
          }
        },
        {
          "imageUrl": "https://example.com/bot/images/item2.jpg",
          "action": {
            "type": "message",
            "label": "Yes",
            "text": "yes"
          }
        },
        {
          "imageUrl": "https://example.com/bot/images/item3.jpg",
          "action": {
            "type": "uri",
            "label": "View detail",
            "uri": "http://example.com/page/222"
          }
        },
        {
          "imageUrl": "https://example.com/bot/images/item3.jpg",
          "action": {
            "type": "uri",
            "label": "View detail",
            "uri": "http://example.com/page/222"
          }
        }
      ]
    }
  }
end
