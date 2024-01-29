require "application_system_test_case"

class NonconformitiesTest < ApplicationSystemTestCase
  setup do
    @nonconformity = nonconformities(:one)
  end

  test "visiting the index" do
    visit nonconformities_url
    assert_selector "h1", text: "Nonconformities"
  end

  test "should create nonconformity" do
    visit nonconformities_url
    click_on "New nonconformity"

    fill_in "Measures", with: @nonconformity.measures_id
    fill_in "Nonconformitylevels", with: @nonconformity.nonconformityLevels_id
    fill_in "Nonconformitylocals", with: @nonconformity.nonconformityLocals_id
    fill_in "Nonconformitytypes", with: @nonconformity.nonconformityTypes_id
    fill_in "Quadrants", with: @nonconformity.quadrants_id
    fill_in "Vehicleparts", with: @nonconformity.vehicleParts_id
    click_on "Create Nonconformity"

    assert_text "Nonconformity was successfully created"
    click_on "Back"
  end

  test "should update Nonconformity" do
    visit nonconformity_url(@nonconformity)
    click_on "Edit this nonconformity", match: :first

    fill_in "Measures", with: @nonconformity.measures_id
    fill_in "Nonconformitylevels", with: @nonconformity.nonconformityLevels_id
    fill_in "Nonconformitylocals", with: @nonconformity.nonconformityLocals_id
    fill_in "Nonconformitytypes", with: @nonconformity.nonconformityTypes_id
    fill_in "Quadrants", with: @nonconformity.quadrants_id
    fill_in "Vehicleparts", with: @nonconformity.vehicleParts_id
    click_on "Update Nonconformity"

    assert_text "Nonconformity was successfully updated"
    click_on "Back"
  end

  test "should destroy Nonconformity" do
    visit nonconformity_url(@nonconformity)
    click_on "Destroy this nonconformity", match: :first

    assert_text "Nonconformity was successfully destroyed"
  end
end
