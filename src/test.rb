def is_matching?()
  {
    "type": "template",
    "altText": "$B%^%C%A%s%02DH]H=Dj(B",
    "template": {
      "type": "confirm",
      "text": "$B%^%C%A%s%0$7$^$9$+!)(B",
      "actions": [
        {
          "type": "postback",
          "label": "Yes",
          "data": "action=matching"
        },
        {
          "type": "message",
          "label": "No",
          "text": "$BBgJQ;DG0$J$,$i%^%C%A%s%0$,@.N)$7$^$;$s$G$7$?(B"
        }
      ]
    }
  }
end
