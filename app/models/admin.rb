class Admin
  def self.models
    models = ActiveRecord::Base.connection.tables - %w{schema_migrations ar_internal_metadata}
    models.map(&:singularize)
  end
end
