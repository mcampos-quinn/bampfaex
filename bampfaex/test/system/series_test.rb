require "application_system_test_case"

class SeriesTest < ApplicationSystemTestCase
  setup do
    @series = series(:one)
  end

  test "visiting the index" do
    visit series_url
    assert_selector "h1", text: "Series"
  end

  test "creating a Series" do
    visit series_url
    click_on "New Series"

    fill_in "Series credits", with: @series.series_credits
    fill_in "Series description", with: @series.series_description
    fill_in "Series end date", with: @series.series_end_date
    fill_in "Series short description", with: @series.series_short_description
    fill_in "Series start date", with: @series.series_start_date
    fill_in "Series title", with: @series.series_title
    fill_in "Series type", with: @series.series_type
    click_on "Create Series"

    assert_text "Series was successfully created"
    click_on "Back"
  end

  test "updating a Series" do
    visit series_url
    click_on "Edit", match: :first

    fill_in "Series credits", with: @series.series_credits
    fill_in "Series description", with: @series.series_description
    fill_in "Series end date", with: @series.series_end_date
    fill_in "Series short description", with: @series.series_short_description
    fill_in "Series start date", with: @series.series_start_date
    fill_in "Series title", with: @series.series_title
    fill_in "Series type", with: @series.series_type
    click_on "Update Series"

    assert_text "Series was successfully updated"
    click_on "Back"
  end

  test "destroying a Series" do
    visit series_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Series was successfully destroyed"
  end
end
