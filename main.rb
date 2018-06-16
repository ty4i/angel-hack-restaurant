# app.rb
require 'dotenv'
require 'sinatra'
require 'line/bot'
<<<<<<< HEAD:app.rb
require 'pg'
<<<<<<< HEAD:main.rb
require './src/get_db_connection'
=======
require './src/sign_up_chef'
require './src/buttons'
>>>>>>> taishi:main.rb
=======
require './src/db_operate'
>>>>>>> f059b1b3c4507616766db414c414e5721c746f99:app.rb

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

  buttons

  events = client.parse_events_from(body)
  events.each { |event|
    case event
    when Line::Bot::Event::Message
      case event.type
      when Line::Bot::Event::MessageType::Text
        # テスト(DB)
        connection = get_db_connection()
        connection.internal_encoding = "UTF-8"
        test(event.message['text'])
      when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
        response = client.get_message_content(event.message['id'])
        tf = Tempfile.open("content")
        tf.write(response.body)
      end
    end
  }

  "OK"
end
