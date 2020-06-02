# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "XtendM3"
  spec.version       = "0.3.8"
  spec.authors       = ["XtendM3"]
  spec.email         = ["xtendm3@infor.com"]

  spec.summary       = %q{A modern, extensibility solution for M3 in cloud.}
  spec.homepage      = "https://github.com/infor-cloud/XtendM3"
  spec.license       = "Apache License version 2"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|bin|_layouts|_includes|lib|Rakefile|_sass|LICENSE|README)}i) }
  spec.executables   << 'xtendm3'
  
  spec.add_runtime_dependency "bundler", "~> 2.1.4"
  spec.add_runtime_dependency "jekyll", ">= 3.8.5", "< 4.1.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.0"
  spec.add_runtime_dependency "rake", ">= 12.3.1", "< 13.1.0"

end
