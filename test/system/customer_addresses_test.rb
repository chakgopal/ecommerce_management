require "application_system_test_case"

class CustomerAddressesTest < ApplicationSystemTestCase
  setup do
    @customer_address = customer_addresses(:one)
  end

  test "visiting the index" do
    visit customer_addresses_url
    assert_selector "h1", text: "Customer Addresses"
  end

  test "creating a Customer address" do
    visit customer_addresses_url
    click_on "New Customer Address"

    fill_in "Address1", with: @customer_address.address1
    fill_in "Address2", with: @customer_address.address2
    fill_in "City", with: @customer_address.city
    fill_in "Country", with: @customer_address.country
    fill_in "Phone1", with: @customer_address.phone1
    fill_in "Phone2", with: @customer_address.phone2
    fill_in "Postalcode", with: @customer_address.postalcode
    fill_in "State", with: @customer_address.state
    click_on "Create Customer address"

    assert_text "Customer address was successfully created"
    click_on "Back"
  end

  test "updating a Customer address" do
    visit customer_addresses_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @customer_address.address1
    fill_in "Address2", with: @customer_address.address2
    fill_in "City", with: @customer_address.city
    fill_in "Country", with: @customer_address.country
    fill_in "Phone1", with: @customer_address.phone1
    fill_in "Phone2", with: @customer_address.phone2
    fill_in "Postalcode", with: @customer_address.postalcode
    fill_in "State", with: @customer_address.state
    click_on "Update Customer address"

    assert_text "Customer address was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer address" do
    visit customer_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer address was successfully destroyed"
  end
end
