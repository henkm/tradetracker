require 'test_helper'

class ProductfeedsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Productfeed.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Productfeed.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Productfeed.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to productfeed_url(assigns(:productfeed))
  end

  def test_edit
    get :edit, :id => Productfeed.first
    assert_template 'edit'
  end

  def test_update_invalid
    Productfeed.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Productfeed.first
    assert_template 'edit'
  end

  def test_update_valid
    Productfeed.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Productfeed.first
    assert_redirected_to productfeed_url(assigns(:productfeed))
  end

  def test_destroy
    productfeed = Productfeed.first
    delete :destroy, :id => productfeed
    assert_redirected_to productfeeds_url
    assert !Productfeed.exists?(productfeed.id)
  end
end
