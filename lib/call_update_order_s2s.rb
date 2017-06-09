require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_update_order_s2s_request = {
    shop_login: 'GESPAY65987',
    order_details: {
        customer_detail: {
            first_name: 'Michael',
            lastname: 'Jordan'
        }
    },
    ## one of the two must be not null
    shop_transaction_id: nil,
    bank_transaction_id: '263'
}

# call to WsS2S ...
result = wss2s.call_update_order_s2s call_update_order_s2s_request

# pretty print result
puts 'Result: '
pp  result
