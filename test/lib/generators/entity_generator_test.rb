require "test_helper"
require "generators/entity/entity_generator"

class EntityGeneratorTest < Rails::Generators::TestCase
  tests EntityGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
