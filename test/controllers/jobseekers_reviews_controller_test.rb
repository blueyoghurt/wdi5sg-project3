require 'test_helper'

class JobseekersReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jobseekers_review = jobseekers_reviews(:one)
  end

  test "should get index" do
    get jobseekers_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_jobseekers_review_url
    assert_response :success
  end

  test "should create jobseekers_review" do
    assert_difference('JobseekersReview.count') do
      post jobseekers_reviews_url, params: { jobseekers_review: { bizowner_id: @jobseekers_review.bizowner_id, job_end_date: @jobseekers_review.job_end_date, jobseeker_id: @jobseekers_review.jobseeker_id, jobseeker_review_description: @jobseekers_review.jobseeker_review_description, jobseeker_review_star: @jobseekers_review.jobseeker_review_star, status: @jobseekers_review.status } }
    end

    assert_redirected_to jobseekers_review_url(JobseekersReview.last)
  end

  test "should show jobseekers_review" do
    get jobseekers_review_url(@jobseekers_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_jobseekers_review_url(@jobseekers_review)
    assert_response :success
  end

  test "should update jobseekers_review" do
    patch jobseekers_review_url(@jobseekers_review), params: { jobseekers_review: { bizowner_id: @jobseekers_review.bizowner_id, job_end_date: @jobseekers_review.job_end_date, jobseeker_id: @jobseekers_review.jobseeker_id, jobseeker_review_description: @jobseekers_review.jobseeker_review_description, jobseeker_review_star: @jobseekers_review.jobseeker_review_star, status: @jobseekers_review.status } }
    assert_redirected_to jobseekers_review_url(@jobseekers_review)
  end

  test "should destroy jobseekers_review" do
    assert_difference('JobseekersReview.count', -1) do
      delete jobseekers_review_url(@jobseekers_review)
    end

    assert_redirected_to jobseekers_reviews_url
  end
end
