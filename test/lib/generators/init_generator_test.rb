require "test_helper"
require "generators/init/init_generator"

class InitGeneratorTest < Rails::Generators::TestCase
  tests InitGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
