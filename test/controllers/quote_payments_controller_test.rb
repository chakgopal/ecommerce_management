require 'test_helper'

class QuotePaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_payment = quote_payments(:one)
  end

  test "should get index" do
    get quote_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_payment_url
    assert_response :success
  end

  test "should create quote_payment" do
    assert_difference('QuotePayment.count') do
      post quote_payments_url, params: { quote_payment: { method: @quote_payment.method, quote_id: @quote_payment.quote_id } }
    end

    assert_redirected_to quote_payment_url(QuotePayment.last)
  end

  test "should show quote_payment" do
    get quote_payment_url(@quote_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_payment_url(@quote_payment)
    assert_response :success
  end

  test "should update quote_payment" do
    patch quote_payment_url(@quote_payment), params: { quote_payment: { method: @quote_payment.method, quote_id: @quote_payment.quote_id } }
    assert_redirected_to quote_payment_url(@quote_payment)
  end

  test "should destroy quote_payment" do
    assert_difference('QuotePayment.count', -1) do
      delete quote_payment_url(@quote_payment)
    end

    assert_redirected_to quote_payments_url
  end
end
