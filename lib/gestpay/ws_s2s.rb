require 'savon'
require 'pp'

module Gestpay

  class WsS2S

    def initialize(environment=:test)
      @environment = environment
      wsdl = if @environment == :test
               'https://testecomm.sella.it/gestpay/gestpayws/WSs2s.asmx?WSDL'
             else
               'https://ecomms2s.sella.it/gestpay/gestpayws/WSs2s.asmx?WSDL'
             end
      @client = Savon.client(wsdl: wsdl)
    end

    def call_pagam_s2s(request)
      check_shop_login(request)
      check_not_null request, :uic_code
      check_not_null request, :amount
      check_not_null request, :shop_transaction_id

      response = @client.call(:call_pagam_s2_s, message: request)

      response.body.dig(:call_pagam_s2_s_response, :call_pagam_s2_s_result, :gest_pay_s2_s)
    end

    def call_settle_s2s(request)
      check_shop_login(request)
      check_not_null request, :uic_code
      check_shop_or_bank_transaction_id_not_null(request, :shop_trans_i_d, :bank_trans_i_d)

      response = @client.call(:call_settle_s2_s, message: request)

      response.body.dig(:call_settle_s2_s_response, :call_settle_s2_s_result, :gest_pay_s2_s)
    end


    def call_delete_s2s(request)
      check_shop_login(request)
      check_shop_or_bank_transaction_id_not_null(request, :shop_transaction_id, :bank_transaction_id)

      response = @client.call(:call_delete_s2_s, message: request)

      response.body.dig(:call_delete_s2_s_response, :call_delete_s2_s_result, :gest_pay_s2_s)
    end

    def call_refund_s2s(request)
      check_shop_login(request)
      check_not_null request, :uic_code
      check_not_null request, :amount
      check_shop_or_bank_transaction_id_not_null(request, :shop_transaction_id, :bank_transaction_id)

      response = @client.call(:call_refund_s2_s, message: request)
      response.body.dig(:call_refund_s2_s_response, :call_refund_s2_s_result, :gest_pay_s2_s)
    end

    def call_read_trx_s2s(request)
      check_shop_login(request)
      check_shop_or_bank_transaction_id_not_null(request, :shop_transaction_id, :bank_transaction_id)

      response = @client.call(:call_read_trx_s2_s, message: request)
      response.body.dig(:call_read_trx_s2_s_response, :call_read_trx_s2_s_result, :gest_pay_s2_s)
    end

    def call_verify_card_s2s(request)
      check_shop_login(request)
      check_not_null request, :shop_transaction_id
      check_not_null request, :card_number
      check_not_null request, :exp_month
      check_not_null request, :exp_year
      check_not_null request, :c_v_v2

      response = @client.call(:call_verifycard_s2_s, message: request)
      response.body.dig(:call_verifycard_s2_s_response, :call_verifycard_s2_s_result, :gest_pay_s2_s)
    end

    def call_check_carta_s2s(request)
      check_shop_login request
      check_not_null request, :shop_transaction_id
      check_not_null request, :with_auth

      response = @client.call(:call_check_carta_s2_s, message: request)
      response.body.dig(:call_check_carta_s2_s_response, :call_check_carta_s2_s_result, :gest_pay_s2_s)
    end

    def call_request_token_s2s(request)
      check_shop_login request
      check_not_null request, :request_token
      check_not_null request, :card_number
      check_not_null request, :expiry_month
      check_not_null request, :expiry_year
      check_not_null request, :cvv
      check_not_null request, :with_auth

      response = @client.call(:call_request_token_s2_s, message: request)
      response.body.dig(:call_request_token_s2_s_response, :call_request_token_s2_s_result, :gest_pay_s2_s)
    end


    private

    def check_shop_login(request)
      raise 'request object is null' if request.nil?
      check_not_null request, :shop_login
    end

    def check_not_null(request, symbol)
      raise "request[:#{symbol.to_s}] is null" if request[symbol].nil?
    end


    def check_shop_or_bank_transaction_id_not_null(request, symbol1, symbol2)
      raise "one of #{symbol1.to_s} or #{symbol2.to_s} must be provided" if request[symbol1].nil? && request[symbol2].nil?
    end
  end
end