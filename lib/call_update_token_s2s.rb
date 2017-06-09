require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_update_token_s2s_request = {
    shop_login: 'GESPAY65987',
    token: '54L76FVYJPBD4012',
    expiry_month: '05',
    expiry_year: '27',
    with_aut: 'N'
}

# call to WsS2S ...
result = wss2s.call_update_token_s2s call_update_token_s2s_request

# pretty print result
puts 'Result: '
pp  result
