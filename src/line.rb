# app.rb
require 'dotenv'
require 'sinatra'
require 'line/bot'
require './src/sign_up_chef'
require './src/sign_up_restaurant'
require './src/find_chef'
require './src/restaurant_list'

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
        when 'シェフ登録'
          client.reply_message(event['replyToken'], sign_up_chef(event.message['text']))
        when '店舗登録'
          client.reply_message(event['replyToken'], sign_up_restaurant)
        when '検索'
          client.reply_message(event['replyToken'], restaurant_list)
        when '店舗一覧'
          client.reply_message(event['replyToken'], restaurant_list)
        else
          message = {
            type: 'text',
            text: event.message['text'] #(p event)
          }
          client.reply_message(event['replyToken'], message)
        end
        #        case event.message['text']
        #        when 'マッチング'
        #          client.reply_message(event['replyToken'], is_matching?)

      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    when Line::Bot::Event::Postback
      #data =  URI::decode_www_form(event['postback']['data']).to_h
      data = event['postback']['data']
      p data
      #p event['postback']
      #case data['chef_sign_up_flag']
      case data
      #when 'yes'
      when 'yes_test'
        message = {
          type: 'text',
          text: '名前，アピールポイント，興味のあるカテゴリ，時間帯を改行して入力してください' #(p event)
        }
        client.reply_message(event['replyToken'], chef_description)
      else
        message = {
          type: 'text',
          text: '情報の登録を取り消しました'
        }
        client.reply_message(event['replyToken'], message)
      end
    end
  }

  "OK"
end
