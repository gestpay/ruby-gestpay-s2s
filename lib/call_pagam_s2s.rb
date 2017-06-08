require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. add more fields (if needed)
call_pagam_s2s_request = {
    shop_login: 'GESPAY65987',
    uic_code: '242',
    amount: '25.00',
    shop_transaction_id: Time.now.strftime('%Y%m%d_%H%M:%S.%L'),
    card_number: '4775718800002026',
    expiry_month: '06',
    expiry_year: '21'
}

# call to WsS2S ...
result = wss2s.call_pagam_s2s call_pagam_s2s_request

# pretty print result
puts 'Result: '
pp  result