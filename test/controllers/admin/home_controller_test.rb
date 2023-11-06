# frozen_string_literal: true

require 'test_helper'

module Admin
  # HomeControllerTest
  class HomeControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get admin_home_index_url
      assert_response :success
    end
  end
end
