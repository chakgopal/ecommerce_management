require 'test_helper'

class QuoteShippingRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_shipping_rate = quote_shipping_rates(:one)
  end

  test "should get index" do
    get quote_shipping_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_shipping_rate_url
    assert_response :success
  end

  test "should create quote_shipping_rate" do
    assert_difference('QuoteShippingRate.count') do
      post quote_shipping_rates_url, params: { quote_shipping_rate: { method_description: @quote_shipping_rate.method_description, price: @quote_shipping_rate.price, quote_address_id: @quote_shipping_rate.quote_address_id, quote_payment_id: @quote_shipping_rate.quote_payment_id } }
    end

    assert_redirected_to quote_shipping_rate_url(QuoteShippingRate.last)
  end

  test "should show quote_shipping_rate" do
    get quote_shipping_rate_url(@quote_shipping_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_shipping_rate_url(@quote_shipping_rate)
    assert_response :success
  end

  test "should update quote_shipping_rate" do
    patch quote_shipping_rate_url(@quote_shipping_rate), params: { quote_shipping_rate: { method_description: @quote_shipping_rate.method_description, price: @quote_shipping_rate.price, quote_address_id: @quote_shipping_rate.quote_address_id, quote_payment_id: @quote_shipping_rate.quote_payment_id } }
    assert_redirected_to quote_shipping_rate_url(@quote_shipping_rate)
  end

  test "should destroy quote_shipping_rate" do
    assert_difference('QuoteShippingRate.count', -1) do
      delete quote_shipping_rate_url(@quote_shipping_rate)
    end

    assert_redirected_to quote_shipping_rates_url
  end
end
