require "test_helper"

class AlcoholsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alcohol = alcohols(:one)
  end

  test "should get index" do
    get alcohols_url
    assert_response :success
  end

  test "should get new" do
    get new_alcohol_url
    assert_response :success
  end

  test "should create alcohol" do
    assert_difference('Alcohol.count') do
      post alcohols_url, params: { alcohol: { name: @alcohol.name, note: @alcohol.note } }
    end

    assert_redirected_to alcohol_url(Alcohol.last)
  end

  test "should show alcohol" do
    get alcohol_url(@alcohol)
    assert_response :success
  end

  test "should get edit" do
    get edit_alcohol_url(@alcohol)
    assert_response :success
  end

  test "should update alcohol" do
    patch alcohol_url(@alcohol), params: { alcohol: { name: @alcohol.name, note: @alcohol.note } }
    assert_redirected_to alcohol_url(@alcohol)
  end

  test "should destroy alcohol" do
    assert_difference('Alcohol.count', -1) do
      delete alcohol_url(@alcohol)
    end

    assert_redirected_to alcohols_url
  end
end
