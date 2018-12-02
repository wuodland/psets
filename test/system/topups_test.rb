require "application_system_test_case"

class TopupsTest < ApplicationSystemTestCase
  setup do
    @topup = topups(:one)
  end

  test "visiting the index" do
    visit topups_url
    assert_selector "h1", text: "Topups"
  end

  test "creating a Topup" do
    visit topups_url
    click_on "New Topup"

    fill_in "Balance", with: @topup.balance
    fill_in "Customer", with: @topup.customer_id
    click_on "Create Topup"

    assert_text "Topup was successfully created"
    click_on "Back"
  end

  test "updating a Topup" do
    visit topups_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @topup.balance
    fill_in "Customer", with: @topup.customer_id
    click_on "Update Topup"

    assert_text "Topup was successfully updated"
    click_on "Back"
  end

  test "destroying a Topup" do
    visit topups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Topup was successfully destroyed"
  end
end
