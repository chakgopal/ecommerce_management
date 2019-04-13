require "application_system_test_case"

class QuotePaymentsTest < ApplicationSystemTestCase
  setup do
    @quote_payment = quote_payments(:one)
  end

  test "visiting the index" do
    visit quote_payments_url
    assert_selector "h1", text: "Quote Payments"
  end

  test "creating a Quote payment" do
    visit quote_payments_url
    click_on "New Quote Payment"

    fill_in "Method", with: @quote_payment.method
    fill_in "Quote", with: @quote_payment.quote_id
    click_on "Create Quote payment"

    assert_text "Quote payment was successfully created"
    click_on "Back"
  end

  test "updating a Quote payment" do
    visit quote_payments_url
    click_on "Edit", match: :first

    fill_in "Method", with: @quote_payment.method
    fill_in "Quote", with: @quote_payment.quote_id
    click_on "Update Quote payment"

    assert_text "Quote payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote payment" do
    visit quote_payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote payment was successfully destroyed"
  end
end
