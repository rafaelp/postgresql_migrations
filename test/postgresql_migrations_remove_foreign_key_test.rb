require File.dirname(__FILE__) + '/test_helper.rb'

class TestPostgresqlMigrationsRemoveForeignKey < Test::Unit::TestCase
  include PostgresqlMigrations

  def test_simple_call_with_strings
    sql = "ALTER TABLE users DROP CONSTRAINT fk_users_account_id"
    expects(:execute).with(sql).returns(true)
    remove_foreign_key('users', 'account_id')
  end

  def test_simple_call_with_symbols
    sql = "ALTER TABLE users DROP CONSTRAINT fk_users_account_id"
    expects(:execute).with(sql).returns(true)
    remove_foreign_key(:users, :account_id)
  end

  def test_multiple_columns_with_strings
    sql = "ALTER TABLE users DROP CONSTRAINT fk_users_account_id_parent_id"
    expects(:execute).with(sql).returns(true)
    remove_foreign_key('users', ['account_id','parent_id'])
  end

  def test_multiple_columns_with_symbols
    sql = "ALTER TABLE users DROP CONSTRAINT fk_users_account_id_parent_id"
    expects(:execute).with(sql).returns(true)
    remove_foreign_key(:users, [:account_id,:parent_id])
  end

end
