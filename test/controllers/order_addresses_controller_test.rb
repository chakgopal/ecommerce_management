require 'test_helper'

class OrderAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_address = order_addresses(:one)
  end

  test "should get index" do
    get order_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_order_address_url
    assert_response :success
  end

  test "should create order_address" do
    assert_difference('OrderAddress.count') do
      post order_addresses_url, params: { order_address: { customer_address_id: @order_address.customer_address_id, order_id: @order_address.order_id } }
    end

    assert_redirected_to order_address_url(OrderAddress.last)
  end

  test "should show order_address" do
    get order_address_url(@order_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_address_url(@order_address)
    assert_response :success
  end

  test "should update order_address" do
    patch order_address_url(@order_address), params: { order_address: { customer_address_id: @order_address.customer_address_id, order_id: @order_address.order_id } }
    assert_redirected_to order_address_url(@order_address)
  end

  test "should destroy order_address" do
    assert_difference('OrderAddress.count', -1) do
      delete order_address_url(@order_address)
    end

    assert_redirected_to order_addresses_url
  end
end
