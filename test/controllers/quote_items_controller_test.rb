require 'test_helper'

class QuoteItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote_item = quote_items(:one)
  end

  test "should get index" do
    get quote_items_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_item_url
    assert_response :success
  end

  test "should create quote_item" do
    assert_difference('QuoteItem.count') do
      post quote_items_url, params: { quote_item: { description: @quote_item.description, name: @quote_item.name, price: @quote_item.price, product_id: @quote_item.product_id, quantity: @quote_item.quantity, quote_id: @quote_item.quote_id, sku: @quote_item.sku, store_id: @quote_item.store_id } }
    end

    assert_redirected_to quote_item_url(QuoteItem.last)
  end

  test "should show quote_item" do
    get quote_item_url(@quote_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_item_url(@quote_item)
    assert_response :success
  end

  test "should update quote_item" do
    patch quote_item_url(@quote_item), params: { quote_item: { description: @quote_item.description, name: @quote_item.name, price: @quote_item.price, product_id: @quote_item.product_id, quantity: @quote_item.quantity, quote_id: @quote_item.quote_id, sku: @quote_item.sku, store_id: @quote_item.store_id } }
    assert_redirected_to quote_item_url(@quote_item)
  end

  test "should destroy quote_item" do
    assert_difference('QuoteItem.count', -1) do
      delete quote_item_url(@quote_item)
    end

    assert_redirected_to quote_items_url
  end
end
