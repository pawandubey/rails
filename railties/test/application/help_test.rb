require "isolation/abstract_unit"

class HelpTest < ActiveSupport::TestCase
  include ActiveSupport::Testing::Isolation

  def setup
    build_app
  end

  def teardown
    teardown_app
  end

  test "command works" do
    output = Dir.chdir(app_path) { `bin/rails help` }
    assert_match "The most common rails commands are", output
  end

  test "short-cut alias works" do
    output = Dir.chdir(app_path) { `bin/rails -h` }
    assert_match "The most common rails commands are", output
  end
end
