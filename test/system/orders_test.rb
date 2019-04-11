require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Discount amount", with: @order.discount_amount
    fill_in "Discount cancelled", with: @order.discount_cancelled
    fill_in "Discount invoice", with: @order.discount_invoice
    fill_in "Discount refunded", with: @order.discount_refunded
    fill_in "Email sent", with: @order.email_sent
    fill_in "Shipping amount", with: @order.shipping_amount
    fill_in "Shipping invoice", with: @order.shipping_invoice
    fill_in "Shipping refunded", with: @order.shipping_refunded
    fill_in "Total cancel", with: @order.total_cancel
    fill_in "Total invoice", with: @order.total_invoice
    fill_in "Total paid", with: @order.total_paid
    fill_in "Total refunded", with: @order.total_refunded
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Discount amount", with: @order.discount_amount
    fill_in "Discount cancelled", with: @order.discount_cancelled
    fill_in "Discount invoice", with: @order.discount_invoice
    fill_in "Discount refunded", with: @order.discount_refunded
    fill_in "Email sent", with: @order.email_sent
    fill_in "Shipping amount", with: @order.shipping_amount
    fill_in "Shipping invoice", with: @order.shipping_invoice
    fill_in "Shipping refunded", with: @order.shipping_refunded
    fill_in "Total cancel", with: @order.total_cancel
    fill_in "Total invoice", with: @order.total_invoice
    fill_in "Total paid", with: @order.total_paid
    fill_in "Total refunded", with: @order.total_refunded
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
