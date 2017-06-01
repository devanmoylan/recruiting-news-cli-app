# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recruitings_news/version'

Gem::Specification.new do |spec|
  spec.name          = "recruiting_news"
  spec.version       = RecruitingNews::VERSION
  spec.authors       = ["'Devan Moylan'"]
  spec.email         = ["'dmmoylan@gmail.com'"]

  spec.summary       = %q{The latest news on high school athletes who aspire to play collegiate athletics.}
  spec.homepage      = "https://github.com/devanmoylan/recruiting-news-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "Set to 'https://github.com/devanmoylan/recruiting-news-cli-app'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
