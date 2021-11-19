# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rake/extensiontask'

spec = Gem::Specification.load('digest-blake2b.gemspec')

Rake::ExtensionTask.new 'digest/blake2b/ext', spec do |ext|
  ext.source_pattern = '*.{c,h}'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  t.warning = true
end

task default: :full

desc 'clean, compile, and run the full test suite'
task full: %i[clean compile test]

def gemspec
  @gemspec ||= begin
                 file = File.expand_path('digest-blake2b.gemspec', __dir__)
                 eval(File.read(file), binding, file)
               end
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

desc "Build the gem"
task :gem => [:gemspec, :build] do
  mkdir_p "pkg"
  sh "gem build digest-blake2b.gemspec"
  mv "#{gemspec.full_name}.gem", "pkg"

  require 'digest/sha2'
  built_gem_path = "pkg/#{gemspec.full_name}.gem"
  checksum = Digest::SHA512.new.hexdigest(File.read(built_gem_path))
  checksum_path = "checksums/#{gemspec.version}.sha512"
  File.open(checksum_path, 'w' ) {|f| f.write(checksum) }
end
