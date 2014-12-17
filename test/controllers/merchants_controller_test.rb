require 'test_helper'

class MerchantsControllerTest < ActionController::TestCase
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post :create, merchant: { business_license: @merchant.business_license, chargeback_email: @merchant.chargeback_email, curr_monthly_sales: @merchant.curr_monthly_sales, custom_order_init: @merchant.custom_order_init, date_modified: @merchant.date_modified, merchant_name: @merchant.merchant_name, merchant_website: @merchant.merchant_website, registered_since: @merchant.registered_since, support_email: @merchant.support_email }
    end

    assert_redirected_to merchant_path(assigns(:merchant))
  end

  test "should show merchant" do
    get :show, id: @merchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant
    assert_response :success
  end

  test "should update merchant" do
    patch :update, id: @merchant, merchant: { business_license: @merchant.business_license, chargeback_email: @merchant.chargeback_email, curr_monthly_sales: @merchant.curr_monthly_sales, custom_order_init: @merchant.custom_order_init, date_modified: @merchant.date_modified, merchant_name: @merchant.merchant_name, merchant_website: @merchant.merchant_website, registered_since: @merchant.registered_since, support_email: @merchant.support_email }
    assert_redirected_to merchant_path(assigns(:merchant))
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete :destroy, id: @merchant
    end

    assert_redirected_to merchants_path
  end
end
