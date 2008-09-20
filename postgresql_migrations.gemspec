spec = Gem::Specification.new do |s| 
  s.name = "postgresql_migrations"
  s.version = "0.1.1"
  s.date     = "2009-09-20"
  s.author = "Rafael Lima"
  s.email = "contato@rafael.adm.br"
  s.homepage = "http://rafael.adm.br/opensource/postgresql_migrations"
  s.platform = Gem::Platform::RUBY
  s.summary = "This gem implements add_foreign_key and remove_foreign_key for PostgreSQLAdapter."
  s.files    = [
    "Manifest",
    "MIT-LICENSE",
    "Rakefile",
		"README.mkdn", 
		"postgresql_migrations.rb"
		"postgresql_migrations.gemspec", 
		"config/requirements.rb",
  ]
  s.test_files = [
    "test/test_helper.rb",
    "test/postgresql_migrations_add_foreign_key_test.rb",
    "test/postgresql_migrations_remove_foreign_key_test.rb",
  ]
  s.require_path = "."
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.mkdn"]
  s.add_dependency("activerecord", ["> 0.0.0"])
  s.add_dependency("pg", ["> 0.0.0"])
end
