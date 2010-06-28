# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{diff}
  s.version = "0.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wayne Walter"]
  s.cert_chain = ["/root/.ssh/gem-public_cert.pem"]
  s.date = %q{2010-06-28}
  s.description = %q{Diff Algorithm Implementation}
  s.email = %q{diffgem@tickzoom.com}
  s.extra_rdoc_files = ["README", "TODO", "lib/diff.rb", "lib/emaildiff.rb", "lib/unixdiff.rb"]
  s.files = ["Manifest", "README", "Rakefile", "TODO", "diff.gemspec", "lib/diff.rb", "lib/emaildiff.rb", "lib/unixdiff.rb", "test/test_cases.rb", "test/test_diff.rb", "test/test_emailcases.rb", "test/test_emaildiff.rb", "test/test_unixdiff.rb"]
  s.homepage = %q{http://users.cybercity.dk/~dsl8950/ruby/diff.html}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Diff", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{diff}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/root/.ssh/gem-private_key.pem}
  s.summary = %q{Diff Algorithm Implementation}
  s.test_files = ["test/test_emailcases.rb", "test/test_emaildiff.rb", "test/test_unixdiff.rb", "test/test_diff.rb", "test/test_cases.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
