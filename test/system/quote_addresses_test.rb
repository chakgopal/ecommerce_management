require "application_system_test_case"

class QuoteAddressesTest < ApplicationSystemTestCase
  setup do
    @quote_address = quote_addresses(:one)
  end

  test "visiting the index" do
    visit quote_addresses_url
    assert_selector "h1", text: "Quote Addresses"
  end

  test "creating a Quote address" do
    visit quote_addresses_url
    click_on "New Quote Address"

    fill_in "Customer address", with: @quote_address.customer_address_id
    fill_in "Customer address type", with: @quote_address.customer_address_type
    fill_in "Customer", with: @quote_address.customer_id
    fill_in "Free shipping", with: @quote_address.free_shipping
    fill_in "Quote", with: @quote_address.quote_id
    fill_in "Same as billing", with: @quote_address.same_as_billing
    fill_in "Shipping method", with: @quote_address.shipping_method
    click_on "Create Quote address"

    assert_text "Quote address was successfully created"
    click_on "Back"
  end

  test "updating a Quote address" do
    visit quote_addresses_url
    click_on "Edit", match: :first

    fill_in "Customer address", with: @quote_address.customer_address_id
    fill_in "Customer address type", with: @quote_address.customer_address_type
    fill_in "Customer", with: @quote_address.customer_id
    fill_in "Free shipping", with: @quote_address.free_shipping
    fill_in "Quote", with: @quote_address.quote_id
    fill_in "Same as billing", with: @quote_address.same_as_billing
    fill_in "Shipping method", with: @quote_address.shipping_method
    click_on "Update Quote address"

    assert_text "Quote address was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote address" do
    visit quote_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote address was successfully destroyed"
  end
end
