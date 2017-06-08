require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_settle_s2s_request = {
    shop_login: 'GESPAY65987',
    uic_code: '242',
    amount: '25.00',
    # only one of the following two is mandatory
    bank_trans_i_d: '263',
    shop_trans_i_d: nil
}

# call to WsS2S ...
result = wss2s.call_settle_s2s call_settle_s2s_request

# pretty print result
puts 'Result: '
pp  result
