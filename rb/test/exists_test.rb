# Checktica SDK exists test

require "minitest/autorun"
require_relative "../Checktica_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = CheckticaSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
