# Write your solution here!
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPEN_API_KEY"))

pp client

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant'"
  }
]

pp "Type 'bye' anytime to exit."
pp "-" * 50
user_input = ""

# Call the API to get the next message from GPT

while user_input != "bye"
  pp ("Hello,how can I help you today?")
  user_input = gets.chomp.strip

  if user_input != "bye"
  message_list.push ({"role" => "user", "content" => user_input})


api_response = client.chat(
  parameters: {
      model: "gpt-3.5-turbo",
      messages: message_list
    }
)

assistant_reply = api_response.dig("choices",0,"message","content")

message_list.push ({"role" => "user", "content" => assistant_reply })

pp "-" * 50
pp assistant_reply
pp "-" * 50

  end
end
