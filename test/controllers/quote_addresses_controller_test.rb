require 'test_helper'

class QuoteAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_address = quote_addresses(:one)
  end

  test "should get index" do
    get quote_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_address_url
    assert_response :success
  end

  test "should create quote_address" do
    assert_difference('QuoteAddress.count') do
      post quote_addresses_url, params: { quote_address: { customer_address_id: @quote_address.customer_address_id, customer_address_type: @quote_address.customer_address_type, customer_id: @quote_address.customer_id, free_shipping: @quote_address.free_shipping, quote_id: @quote_address.quote_id, same_as_billing: @quote_address.same_as_billing, shipping_method: @quote_address.shipping_method } }
    end

    assert_redirected_to quote_address_url(QuoteAddress.last)
  end

  test "should show quote_address" do
    get quote_address_url(@quote_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_address_url(@quote_address)
    assert_response :success
  end

  test "should update quote_address" do
    patch quote_address_url(@quote_address), params: { quote_address: { customer_address_id: @quote_address.customer_address_id, customer_address_type: @quote_address.customer_address_type, customer_id: @quote_address.customer_id, free_shipping: @quote_address.free_shipping, quote_id: @quote_address.quote_id, same_as_billing: @quote_address.same_as_billing, shipping_method: @quote_address.shipping_method } }
    assert_redirected_to quote_address_url(@quote_address)
  end

  test "should destroy quote_address" do
    assert_difference('QuoteAddress.count', -1) do
      delete quote_address_url(@quote_address)
    end

    assert_redirected_to quote_addresses_url
  end
end
