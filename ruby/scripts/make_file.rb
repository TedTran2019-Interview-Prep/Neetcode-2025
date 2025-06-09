#!/usr/bin/env ruby

require 'fileutils'

filename = ARGV[0]

if filename.nil? || filename.strip.empty?
  puts 'Usage: ruby scripts/make_file.rb <name>'
  exit 1
end

base_name = filename.strip.downcase
project_root = File.expand_path('..', __dir__)
lib_dir = File.join(project_root, 'lib')
doc_dir = File.join(project_root, 'formation_engineering_method')

unless Dir.exist?(lib_dir)
  puts "Error: '#{lib_dir}' does not exist."
  exit 1
end

unless Dir.exist?(doc_dir)
  puts "Error: '#{doc_dir}' does not exist."
  exit 1
end

lib_path = File.join(lib_dir, "#{base_name}.rb")
doc_path = File.join(doc_dir, "#{base_name}.md")

if File.exist?(lib_path)
  puts "Skipped (already exists): #{lib_path}"
else
  File.write(lib_path, "# frozen_string_literal: true\n\n")
  puts "Created: #{lib_path}"
end

if File.exist?(doc_path)
  puts "Skipped (already exists): #{doc_path}"
else
  File.write(doc_path, "```ruby\n\n```\n")
  puts "Created: #{doc_path}"
end
