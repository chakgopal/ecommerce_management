require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Coupon code", with: @quote.coupon_code
    fill_in "Customer", with: @quote.customer_id
    fill_in "Grand total", with: @quote.grand_total
    fill_in "Item count", with: @quote.item_count
    fill_in "Item quantity", with: @quote.item_quantity
    fill_in "Status", with: @quote.status
    fill_in "Store", with: @quote.store_id
    fill_in "Subtotal", with: @quote.subtotal
    fill_in "Subtotal with discount", with: @quote.subtotal_with_discount
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Coupon code", with: @quote.coupon_code
    fill_in "Customer", with: @quote.customer_id
    fill_in "Grand total", with: @quote.grand_total
    fill_in "Item count", with: @quote.item_count
    fill_in "Item quantity", with: @quote.item_quantity
    fill_in "Status", with: @quote.status
    fill_in "Store", with: @quote.store_id
    fill_in "Subtotal", with: @quote.subtotal
    fill_in "Subtotal with discount", with: @quote.subtotal_with_discount
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
