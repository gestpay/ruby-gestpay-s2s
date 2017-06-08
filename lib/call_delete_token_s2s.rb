require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_delete_token_s2s_request = {
    shop_login: 'GESPAY65987',
    token_value: '54L76FC92IK64012'
}

# call to WsS2S ...
result = wss2s.call_delete_token_s2s call_delete_token_s2s_request

# pretty print result
puts 'Result: '
pp  result
