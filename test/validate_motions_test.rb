require "date"
require "fileutils"
require "minitest/autorun"
require "tmpdir"
require "yaml"

require_relative "../script/validate_motions"

class MotionValidatorTest < Minitest::Test
  AGENTS = %w[claude antigravity].freeze

  def setup
    @directory = Dir.mktmpdir
  end

  def teardown
    FileUtils.remove_entry(@directory)
  end

  def test_accepts_valid_motion_front_matter
    assert_empty validate_file
  end

  def test_rejects_number_that_does_not_match_filename
    errors = validate_file(number: 2)

    assert_match(/number must match the filename \(1\)/, errors.join("\n"))
  end

  def test_rejects_invalid_date
    errors = validate_file(date: "not-a-date")

    assert_match(/date must be a valid ISO date/, errors.join("\n"))
  end

  private

  def validate_file(overrides = {})
    data = {
      "number" => 1,
      "title" => "A motion",
      "date" => Date.new(2026, 11, 24),
      "sides" => { "claude" => "for", "antigravity" => "against" },
      "before" => { "claude" => "Opening view", "antigravity" => "Opening view" },
      "debate" => [{ "by" => "claude", "text" => "First turn" }],
      "after" => { "claude" => "Closing view", "antigravity" => "Closing view" }
    }.merge(overrides.transform_keys(&:to_s))

    yaml = YAML.dump(data).sub(/\A---\s*\n/, "")
    path = File.join(@directory, "motion-1.md")
    File.write(path, "---\n#{yaml}---\n")
    MotionValidator.validate_file(path, "motion", AGENTS)
  end
end
