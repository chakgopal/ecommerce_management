require "application_system_test_case"

class QuoteShippingRatesTest < ApplicationSystemTestCase
  setup do
    @quote_shipping_rate = quote_shipping_rates(:one)
  end

  test "visiting the index" do
    visit quote_shipping_rates_url
    assert_selector "h1", text: "Quote Shipping Rates"
  end

  test "creating a Quote shipping rate" do
    visit quote_shipping_rates_url
    click_on "New Quote Shipping Rate"

    fill_in "Method description", with: @quote_shipping_rate.method_description
    fill_in "Price", with: @quote_shipping_rate.price
    fill_in "Quote address", with: @quote_shipping_rate.quote_address_id
    fill_in "Quote payment", with: @quote_shipping_rate.quote_payment_id
    click_on "Create Quote shipping rate"

    assert_text "Quote shipping rate was successfully created"
    click_on "Back"
  end

  test "updating a Quote shipping rate" do
    visit quote_shipping_rates_url
    click_on "Edit", match: :first

    fill_in "Method description", with: @quote_shipping_rate.method_description
    fill_in "Price", with: @quote_shipping_rate.price
    fill_in "Quote address", with: @quote_shipping_rate.quote_address_id
    fill_in "Quote payment", with: @quote_shipping_rate.quote_payment_id
    click_on "Update Quote shipping rate"

    assert_text "Quote shipping rate was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote shipping rate" do
    visit quote_shipping_rates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote shipping rate was successfully destroyed"
  end
end
