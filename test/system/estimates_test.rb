require "application_system_test_case"

class EstimatesTest < ApplicationSystemTestCase
  setup do
    @estimate = estimates(:one)
  end

  test "visiting the index" do
    visit estimates_url
    assert_selector "h1", text: "Estimates"
  end

  test "should create estimate" do
    visit estimates_url
    click_on "New estimate"

    fill_in "Statement", with: @estimate.statement_id
    click_on "Create Estimate"

    assert_text "Estimate was successfully created"
    click_on "Back"
  end

  test "should update Estimate" do
    visit estimate_url(@estimate)
    click_on "Edit this estimate", match: :first

    fill_in "Statement", with: @estimate.statement_id
    click_on "Update Estimate"

    assert_text "Estimate was successfully updated"
    click_on "Back"
  end

  test "should destroy Estimate" do
    visit estimate_url(@estimate)
    click_on "Destroy this estimate", match: :first

    assert_text "Estimate was successfully destroyed"
  end
end
