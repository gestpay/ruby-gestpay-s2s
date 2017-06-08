require 'test/unit'
require 'pp'

require_relative '../lib/gestpay/ws_s2s'

module Gestpay
  class WsS2STest < Test::Unit::TestCase

    def setup
      @shop_login = 'GESPAY65987'
      @wsS2S = WsS2S.new
    end

    def test_call_pagam_s2s

      response = @wsS2S.call_pagam_s2s ({
          shop_login: @shop_login,
          uic_code: '242',
          amount: '25.00',
          shop_transaction_id: Time.now.strftime('%Y%m%d_%H%M:%S.%L'),
          card_number: '4775718800002026',
          expiry_month: '06',
          expiry_year: '21'
      })

      puts response.pretty_inspect

      assert_not_nil response
      assert_equal 'OK', response[:transaction_result]

    end
  end
end