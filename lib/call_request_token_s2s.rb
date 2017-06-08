require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_request_token_s2s_request = {
    shop_login: 'GESPAY65987',
    with_auth: 'Y',
    card_number: '5412388800004012',
    expiry_month: '05',
    expiry_year: '27',
    cvv: '123',
    request_token: 'MASKEDPAN'
}

# call to WsS2S ...
result = wss2s.call_request_token_s2s call_request_token_s2s_request

# pretty print result
puts 'Result: '
pp  result
