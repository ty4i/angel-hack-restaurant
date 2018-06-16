<<<<<<< HEAD
# app.rb
require 'dotenv'
require 'sinatra'
require 'line/bot'

def client
  @client ||= Line::Bot::Client.new { |config|
    Dotenv.load ".env"
    config.channel_secret = ENV['CHANNEL_SECRET']
    config.channel_token = ENV['CHANNEL_ACCESS_TOKEN']
  }
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

  events = client.parse_events_from(body)
  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text

        message = {
          type: 'text',
          text: (p event) #event.message['text']
        }
        client.reply_message(event['replyToken'], message)
      # when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
      #   response = client.get_message_content(event.message['id'])
      #   tf = Tempfile.open("content")
      #   tf.write(response.body)
      # end
    end
  }
  "OK"
=======
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
>>>>>>> taishi
end
