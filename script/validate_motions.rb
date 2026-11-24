#!/usr/bin/env ruby

require "date"
require "yaml"

module MotionValidator
  COLLECTIONS = {
    "_episodes" => "motion",
    "_it_motions" => "mozione"
  }.freeze

  def self.validate_file(path, prefix, agents)
    errors = []
    basename = File.basename(path)
    match = basename.match(/\A#{prefix}-(\d+)\.md\z/)
    unless match
      return ["#{path}: expected filename #{prefix}-<number>.md"]
    end

    content = File.read(path)
    front_matter = content.match(/\A---[ \t]*\r?\n(.*?)\r?\n---[ \t]*(?:\r?\n|\z)/m)
    unless front_matter
      return ["#{path}: missing YAML front matter"]
    end

    data = YAML.safe_load(front_matter[1], permitted_classes: [Date], aliases: true)
    unless data.is_a?(Hash)
      return ["#{path}: front matter must be a mapping"]
    end

    number = data["number"]
    errors << "#{path}: number must match the filename (#{match[1]})" unless number == match[1].to_i
    errors << "#{path}: title must be a non-empty string" unless non_empty_string?(data["title"])
    unless data["date"].instance_of?(Date) || valid_date_string?(data["date"])
      errors << "#{path}: date must be a valid ISO date"
    end

    sides = data["sides"]
    if !sides.is_a?(Hash) || sides.keys.sort != agents.sort || agents.map { |agent| sides[agent] }.sort != %w[against for]
      errors << "#{path}: sides must assign the configured agents one each to 'for' and 'against'"
    end

    %w[before after].each do |field|
      entries = data[field]
      unless entries.is_a?(Hash) && agents.all? { |agent| non_empty_string?(entries[agent]) }
        errors << "#{path}: #{field} must contain a non-empty note for each configured agent"
      end
    end

    debate = data["debate"]
    valid_debate = debate.is_a?(Array) && !debate.empty? && debate.all? do |turn|
      turn.is_a?(Hash) && agents.include?(turn["by"]) && non_empty_string?(turn["text"])
    end
    unless valid_debate
      errors << "#{path}: debate must contain turns with a configured 'by' and non-empty 'text'"
    end

    errors
  rescue Psych::Exception => e
    ["#{path}: invalid YAML front matter (#{e.message.lines.first.strip})"]
  end

  def self.validate(root)
    config = YAML.safe_load(
      File.read(File.join(root, "_config.yml")),
      permitted_classes: [Date],
      aliases: true
    )
    configured_agents = config.is_a?(Hash) ? config["agents"] : nil
    unless configured_agents.is_a?(Hash) && configured_agents.length == 2
      return ["_config.yml: agents must define exactly two Motion speakers"]
    end
    agents = configured_agents.keys

    errors = []
    COLLECTIONS.each do |directory, prefix|
      paths = Dir.glob(File.join(root, directory, "*.md")).sort
      errors << "#{directory}: no Motion episodes found" if paths.empty?
      numbers = {}
      paths.each do |path|
        file_errors = validate_file(path, prefix, agents)
        errors.concat(file_errors)
        match = File.basename(path).match(/\A#{prefix}-(\d+)\.md\z/)
        if match
          number = match[1].to_i
          errors << "#{path}: duplicate episode number #{number} in #{directory}" if numbers.key?(number)
          numbers[number] = path
        end
      end
    end
    errors
  rescue Psych::Exception, KeyError => e
    ["_config.yml: unable to read configured Motion agents (#{e.message})"]
  end

  def self.non_empty_string?(value)
    value.is_a?(String) && !value.strip.empty?
  end
  private_class_method :non_empty_string?

  def self.valid_date_string?(value)
    return false unless value.is_a?(String) && value.match?(/\A\d{4}-\d{2}-\d{2}\z/)

    Date.iso8601(value)
    true
  rescue Date::Error
    false
  end
  private_class_method :valid_date_string?
end

if $PROGRAM_NAME == __FILE__
  errors = MotionValidator.validate(ARGV.fetch(0, "."))
  if errors.empty?
    puts "Motion content is valid."
  else
    warn errors.join("\n")
    exit 1
  end
end
