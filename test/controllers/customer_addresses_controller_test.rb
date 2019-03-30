require 'test_helper'

class CustomerAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_address = customer_addresses(:one)
  end

  test "should get index" do
    get customer_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_address_url
    assert_response :success
  end

  test "should create customer_address" do
    assert_difference('CustomerAddress.count') do
      post customer_addresses_url, params: { customer_address: { address1: @customer_address.address1, address2: @customer_address.address2, city: @customer_address.city, country: @customer_address.country, phone1: @customer_address.phone1, phone2: @customer_address.phone2, postalcode: @customer_address.postalcode, state: @customer_address.state } }
    end

    assert_redirected_to customer_address_url(CustomerAddress.last)
  end

  test "should show customer_address" do
    get customer_address_url(@customer_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_address_url(@customer_address)
    assert_response :success
  end

  test "should update customer_address" do
    patch customer_address_url(@customer_address), params: { customer_address: { address1: @customer_address.address1, address2: @customer_address.address2, city: @customer_address.city, country: @customer_address.country, phone1: @customer_address.phone1, phone2: @customer_address.phone2, postalcode: @customer_address.postalcode, state: @customer_address.state } }
    assert_redirected_to customer_address_url(@customer_address)
  end

  test "should destroy customer_address" do
    assert_difference('CustomerAddress.count', -1) do
      delete customer_address_url(@customer_address)
    end

    assert_redirected_to customer_addresses_url
  end
end
