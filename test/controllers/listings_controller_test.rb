require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listing = listings(:one)
  end

  test "should get index" do
    get listings_url
    assert_response :success
  end

  test "should get new" do
    get new_listing_url
    assert_response :success
  end

  test "should create listing" do
    assert_difference('Listing.count') do
      post listings_url, params: { listing: { business_owner_id: @listing.business_owner_id, industry: @listing.industry, job_description: @listing.job_description, job_end_date: @listing.job_end_date, job_start_date: @listing.job_start_date, job_title: @listing.job_title, work_area: @listing.work_area, status: @listing.status, vacancy: @listing.vacancy, wage_per_hour: @listing.wage_per_hour, work_location: @listing.work_location, work_location_postal_code: @listing.work_location_postal_code } }
    end

    assert_redirected_to listing_url(Listing.last)
  end

  test "should show listing" do
    get listing_url(@listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_listing_url(@listing)
    assert_response :success
  end

  test "should update listing" do
    patch listing_url(@listing), params: { listing: { business_owner_id: @listing.business_owner_id, industry: @listing.industry, job_description: @listing.job_description, job_end_date: @listing.job_end_date, job_start_date: @listing.job_start_date, job_title: @listing.job_title, work_area: @listing.work_area, status: @listing.status, vacancy: @listing.vacancy, wage_per_hour: @listing.wage_per_hour, work_location: @listing.work_location, work_location_postal_code: @listing.work_location_postal_code } }
    assert_redirected_to listing_url(@listing)
  end

  test "should destroy listing" do
    assert_difference('Listing.count', -1) do
      delete listing_url(@listing)
    end

    assert_redirected_to listings_url
  end
end
