require "application_system_test_case"

class OrderAddressesTest < ApplicationSystemTestCase
  setup do
    @order_address = order_addresses(:one)
  end

  test "visiting the index" do
    visit order_addresses_url
    assert_selector "h1", text: "Order Addresses"
  end

  test "creating a Order address" do
    visit order_addresses_url
    click_on "New Order Address"

    fill_in "Customer address", with: @order_address.customer_address_id
    fill_in "Order", with: @order_address.order_id
    click_on "Create Order address"

    assert_text "Order address was successfully created"
    click_on "Back"
  end

  test "updating a Order address" do
    visit order_addresses_url
    click_on "Edit", match: :first

    fill_in "Customer address", with: @order_address.customer_address_id
    fill_in "Order", with: @order_address.order_id
    click_on "Update Order address"

    assert_text "Order address was successfully updated"
    click_on "Back"
  end

  test "destroying a Order address" do
    visit order_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order address was successfully destroyed"
  end
end
