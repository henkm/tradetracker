require 'test_helper'

class AffiliatesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Affiliate.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Affiliate.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Affiliate.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to affiliate_url(assigns(:affiliate))
  end

  def test_edit
    get :edit, :id => Affiliate.first
    assert_template 'edit'
  end

  def test_update_invalid
    Affiliate.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Affiliate.first
    assert_template 'edit'
  end

  def test_update_valid
    Affiliate.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Affiliate.first
    assert_redirected_to affiliate_url(assigns(:affiliate))
  end

  def test_destroy
    affiliate = Affiliate.first
    delete :destroy, :id => affiliate
    assert_redirected_to affiliates_url
    assert !Affiliate.exists?(affiliate.id)
  end
end
