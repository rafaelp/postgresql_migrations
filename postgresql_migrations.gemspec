spec = Gem::Specification.new do |s| 
  s.name = "postgresql_migrations"
  s.version = "0.1.0"
  s.date     = "2009-09-18"
  s.author = "Rafael Lima"
  s.email = "contato@rafael.adm.br"
  s.homepage = "http://rafael.adm.br"
  s.platform = Gem::Platform::RUBY
  s.summary = "This gem implements add_foreign_key and remove_foreign_key for PostgreSQLAdapter."
  s.files    = [
    "MIT-LICENSE",
    "Rakefile",
		"README.mkdn", 
		"postgresql_migrations.gemspec", 
		"config/requirements.rb",
		"lib/postgresql_migrations.rb"]
  s.test_files = [
    "test/test_helper.rb",
    "test/postgresql_migrations_add_foreign_key_test.rb",
    "test/postgresql_migrations_remove_foreign_key_test.rb",
     ]
  s.require_path = "lib"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.mkdn"]
  s.add_dependency("activerecord", ["> 0.0.0"])
  s.add_dependency("postgres", ["> 0.0.0"])
end
