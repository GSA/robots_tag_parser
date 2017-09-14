# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "robots_tag_parser/version"

Gem::Specification.new do |spec|
  spec.name          = "robots_tag_parser"
  spec.version       = RobotsTagParser::VERSION
  spec.authors       = ["Martha Thompson"]
  spec.email         = ["mothonmars@gmail.com"]

  spec.summary       = %q{X-Robots-Tag HTTP header parser}
  spec.description   = %q{A simple gem to parse X-Robots-Tag HTTP headers according to Google X-Robots-Tag HTTP header specifications.}
  spec.homepage      = "https://github.com/MothOnMars/robots_tag_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.4"
  spec.add_development_dependency "simplecov", "~> 0.12.0"
end
