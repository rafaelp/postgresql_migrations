require File.dirname(__FILE__) + '/test_helper.rb'

class TestPostgresqlMigrationsAddForeignKey < Test::Unit::TestCase
  include PostgresqlMigrations
  
  def test_simple_call_with_strings
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES account(id)"
    expects(:execute).with(sql).returns(true)
    add_foreign_key('users', 'account_id', 'account', 'id')
  end

  def test_simple_call_with_symbols
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES account(id)"
    expects(:execute).with(sql).returns(true)
    add_foreign_key(:users, :account_id, :account, :id)
  end

  def test_multiple_columns_with_strings
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id_account_version FOREIGN KEY (account_id,account_version) REFERENCES account(id,version)"
    expects(:execute).with(sql).returns(true)
    add_foreign_key('users', ['account_id','account_version'], 'account', ['id','version'])
  end

  def test_multiple_columns_with_symbols
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id_account_version FOREIGN KEY (account_id,account_version) REFERENCES account(id,version)"
    expects(:execute).with(sql).returns(true)
    add_foreign_key(:users, [:account_id,:account_version], :account, [:id,:version])
  end

  def test_call_with_match
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES account(id) MATCH simple"
    expects(:execute).with(sql).returns(true)
    add_foreign_key('users', 'account_id', 'account', 'id', :match => 'simple')
  end

  def test_call_with_on_delete
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES account(id) ON DELETE cascade"
    expects(:execute).with(sql).returns(true)
    add_foreign_key('users', 'account_id', 'account', 'id', :on_delete => 'cascade')
  end

  def test_call_with_on_update
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES account(id) ON UPDATE cascade"
    expects(:execute).with(sql).returns(true)
    add_foreign_key('users', 'account_id', 'account', 'id', :on_update => 'cascade')
  end

  def test_call_with_match_on_delete_and_on_update
    sql = "ALTER TABLE users ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES account(id) MATCH full ON DELETE restrict ON UPDATE restrict"
    expects(:execute).with(sql).returns(true)
    add_foreign_key('users', 'account_id', 'account', 'id', :match => 'full', :on_delete => 'restrict', :on_update => 'restrict')
  end

end
