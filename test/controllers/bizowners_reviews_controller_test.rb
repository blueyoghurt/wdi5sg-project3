require 'test_helper'

class BizownersReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bizowners_review = bizowners_reviews(:one)
  end

  test "should get index" do
    get bizowners_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_bizowners_review_url
    assert_response :success
  end

  test "should create bizowners_review" do
    assert_difference('BizownersReview.count') do
      post bizowners_reviews_url, params: { bizowners_review: { bizowner_id: @bizowners_review.bizowner_id, bizowner_review_star: @bizowners_review.bizowner_review_star, business_review_description: @bizowners_review.business_review_description, job_end_date: @bizowners_review.job_end_date, jobseeker_id: @bizowners_review.jobseeker_id, status: @bizowners_review.status } }
    end

    assert_redirected_to bizowners_review_url(BizownersReview.last)
  end

  test "should show bizowners_review" do
    get bizowners_review_url(@bizowners_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_bizowners_review_url(@bizowners_review)
    assert_response :success
  end

  test "should update bizowners_review" do
    patch bizowners_review_url(@bizowners_review), params: { bizowners_review: { bizowner_id: @bizowners_review.bizowner_id, bizowner_review_star: @bizowners_review.bizowner_review_star, business_review_description: @bizowners_review.business_review_description, job_end_date: @bizowners_review.job_end_date, jobseeker_id: @bizowners_review.jobseeker_id, status: @bizowners_review.status } }
    assert_redirected_to bizowners_review_url(@bizowners_review)
  end

  test "should destroy bizowners_review" do
    assert_difference('BizownersReview.count', -1) do
      delete bizowners_review_url(@bizowners_review)
    end

    assert_redirected_to bizowners_reviews_url
  end
end
