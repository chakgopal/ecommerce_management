require "application_system_test_case"

class QuoteItemsTest < ApplicationSystemTestCase
  setup do
    @quote_item = quote_items(:one)
  end

  test "visiting the index" do
    visit quote_items_url
    assert_selector "h1", text: "Quote Items"
  end

  test "creating a Quote item" do
    visit quote_items_url
    click_on "New Quote Item"

    fill_in "Description", with: @quote_item.description
    fill_in "Name", with: @quote_item.name
    fill_in "Price", with: @quote_item.price
    fill_in "Product", with: @quote_item.product_id
    fill_in "Quantity", with: @quote_item.quantity
    fill_in "Quote", with: @quote_item.quote_id
    fill_in "Sku", with: @quote_item.sku
    fill_in "Store", with: @quote_item.store_id
    click_on "Create Quote item"

    assert_text "Quote item was successfully created"
    click_on "Back"
  end

  test "updating a Quote item" do
    visit quote_items_url
    click_on "Edit", match: :first

    fill_in "Description", with: @quote_item.description
    fill_in "Name", with: @quote_item.name
    fill_in "Price", with: @quote_item.price
    fill_in "Product", with: @quote_item.product_id
    fill_in "Quantity", with: @quote_item.quantity
    fill_in "Quote", with: @quote_item.quote_id
    fill_in "Sku", with: @quote_item.sku
    fill_in "Store", with: @quote_item.store_id
    click_on "Update Quote item"

    assert_text "Quote item was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote item" do
    visit quote_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote item was successfully destroyed"
  end
end
