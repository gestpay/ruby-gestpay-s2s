require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_refund_s2s_request = {
    shop_login: 'GESPAY65987',
    bank_transaction_id: '263',
    uic_code: '242',
    amount: '1'
}

# call to WsS2S ...
result = wss2s.call_refund_s2s call_refund_s2s_request

# pretty print result
puts 'Result: '
pp  result
