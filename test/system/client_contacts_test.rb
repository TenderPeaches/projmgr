require "application_system_test_case"

class ClientContactsTest < ApplicationSystemTestCase
  setup do
    @client_contact = client_contacts(:one)
  end

  test "visiting the index" do
    visit client_contacts_url
    assert_selector "h1", text: "Client contacts"
  end

  test "should create client contact" do
    visit client_contacts_url
    click_on "New client contact"

    click_on "Create Client contact"

    assert_text "Client contact was successfully created"
    click_on "Back"
  end

  test "should update Client contact" do
    visit client_contact_url(@client_contact)
    click_on "Edit this client contact", match: :first

    click_on "Update Client contact"

    assert_text "Client contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Client contact" do
    visit client_contact_url(@client_contact)
    click_on "Destroy this client contact", match: :first

    assert_text "Client contact was successfully destroyed"
  end
end
