require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_check_carta_s2s_request = {
    shop_login: 'GESPAY65987',
    shop_transaction_id: Time.now.strftime('%Y%m%d_%H%M:%S.%L'),
    with_auth: 'Y',
    card_number: '5412388800004012',
    exp_month: '05',
    exp_year: '27',
    c_v_v2: '123',
    token_value: nil
}

# call to WsS2S ...
result = wss2s.call_check_carta_s2s call_check_carta_s2s_request

# pretty print result
puts 'Result: '
pp  result
