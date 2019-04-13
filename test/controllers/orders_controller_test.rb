require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { discount_amount: @order.discount_amount, discount_cancelled: @order.discount_cancelled, discount_invoice: @order.discount_invoice, discount_refunded: @order.discount_refunded, email_sent: @order.email_sent, shipping_amount: @order.shipping_amount, shipping_invoice: @order.shipping_invoice, shipping_refunded: @order.shipping_refunded, total_cancel: @order.total_cancel, total_invoice: @order.total_invoice, total_paid: @order.total_paid, total_refunded: @order.total_refunded } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { discount_amount: @order.discount_amount, discount_cancelled: @order.discount_cancelled, discount_invoice: @order.discount_invoice, discount_refunded: @order.discount_refunded, email_sent: @order.email_sent, shipping_amount: @order.shipping_amount, shipping_invoice: @order.shipping_invoice, shipping_refunded: @order.shipping_refunded, total_cancel: @order.total_cancel, total_invoice: @order.total_invoice, total_paid: @order.total_paid, total_refunded: @order.total_refunded } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
