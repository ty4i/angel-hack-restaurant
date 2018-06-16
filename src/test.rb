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
>>>>>>> taishi
end
