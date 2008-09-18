# PostgresqlMigrations

module PostgresqlMigrations
  def add_foreign_key(from_table, from_columns, to_table, to_columns, options = {})
    from_columns = [from_columns] unless from_columns.is_a? Array
    to_columns = [to_columns] unless to_columns.is_a? Array

    constraint_name = "fk_#{from_table}_#{from_columns.join('_')}"

    sql = "ALTER TABLE #{from_table} ADD CONSTRAINT #{constraint_name} FOREIGN KEY (#{from_columns.join(',')}) REFERENCES #{to_table}(#{to_columns.join(',')})"

    # MATCH

    # FULL
    #  will not allow one column of a multicolumn foreign key to be null unless all foreign key columns are null
    # PARTIAL
    #  is not yet implemented
    # SIMPLE
    #  allows some foreign key columns to be null while other parts of the foreign key are not null
    sql << " MATCH #{options[:match]}" unless options[:match].nil?

    # ACTIONS
    
    # NO ACTION
    #  Produce an error indicating that the deletion or update would create a foreign key constraint violation. If the constraint is deferred, this error will be produced at constraint check time if there still exist any referencing rows. This is the default action. 
    # RESTRICT
    #  Produce an error indicating that     constraint_name = "fk_#{from_table}_#{from_columns.join('_')}"the deletion or update would create a foreign key constraint violation. This is the same as NO ACTION except that the check is not deferrable. 
    # CASCADE
    #  Delete any rows referencing the deleted row, or update the value of the referencing column to the new value of the referenced column, respectively. 
    # SET NULL
    #  Set the referencing column(s) to null. 
    # SET DEFAULT
    #  Set the referencing column(s) to their default values. 
    sql << " ON DELETE #{options[:on_delete]}" unless options[:on_delete].nil?
    sql << " ON UPDATE #{options[:on_update]}" unless options[:on_update].nil?
    
    execute sql
  end

  def remove_foreign_key(from_table, from_columns)
    from_columns = [from_columns] unless from_columns.is_a? Array
    constraint_name = "fk_#{from_table}_#{from_columns.join('_')}"

    sql = "ALTER TABLE #{from_table} DROP CONSTRAINT #{constraint_name}"
    execute sql
  end
end

ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.send :include, PostgresqlMigrations
