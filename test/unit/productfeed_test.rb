require 'test_helper'

class ProductfeedTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Productfeed.new.valid?
  end
end
