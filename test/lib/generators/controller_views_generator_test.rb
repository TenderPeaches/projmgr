require "test_helper"
require "generators/controller_views/controller_views_generator"

class ControllerViewsGeneratorTest < Rails::Generators::TestCase
  tests ControllerViewsGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
