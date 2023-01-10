require "application_system_test_case"

class AlcoholsTest < ApplicationSystemTestCase
  setup do
    @alcohol = alcohols(:one)
  end

  test "visiting the index" do
    visit alcohols_url
    assert_selector "h1", text: "Alcohols"
  end

  test "creating a Alcohol" do
    visit alcohols_url
    click_on "New Alcohol"

    fill_in "Name", with: @alcohol.name
    fill_in "Note", with: @alcohol.note
    click_on "Create Alcohol"

    assert_text "Alcohol was successfully created"
    click_on "Back"
  end

  test "updating a Alcohol" do
    visit alcohols_url
    click_on "Edit", match: :first

    fill_in "Name", with: @alcohol.name
    fill_in "Note", with: @alcohol.note
    click_on "Update Alcohol"

    assert_text "Alcohol was successfully updated"
    click_on "Back"
  end

  test "destroying a Alcohol" do
    visit alcohols_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Alcohol was successfully destroyed"
  end
end
