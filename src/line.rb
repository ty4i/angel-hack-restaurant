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
        case event.message['text']
        when 'シェフの情報を登録します'
          client.reply_message(event['replyToken'], sign_up_chef)
        end
        case event.message['text']
        when 'お店の情報を登録します'
          client.reply_message(event['replyToken'], sign_up_restaurant)
        end
        case event.message['text']
        when '登録されているシェフを探します'
          client.reply_message(event['replyToken'], find_chef)
        end
        case event.message['text']
        when '登録されているレストランを探します'
          client.reply_message(event['replyToken'], restaurant_list)
        end
        case event.message['text']
        when 'マッチング'
          client.reply_message(event['replyToken'], is_matching?)
        end


        # message = {
        #   type: 'text',
        #   text:event.message['text'] #(p event) 
        # }
        # client.reply_message(event['replyToken'], message)


      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    end
  }

  "OK"
end
