require_relative 'gestpay/ws_s2s'
require 'pp'

wss2s = Gestpay::WsS2S.new :test

# input object. Add more fields if needed
call_exchange_rate_s2s_request = {
    shop_login: 'GESPAY65987',
    ## only one of the following must be not null
    uic_code: '1',
    iso_code: 'USD',
    numeric_iso_code: '840'
}

# call to WsS2S ...
result = wss2s.call_exchange_rate_s2s call_exchange_rate_s2s_request

# pretty print result
puts 'Result: '
pp  result
