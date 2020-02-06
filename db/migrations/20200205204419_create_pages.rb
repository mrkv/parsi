Hanami::Model.migration do
  change do
    extension :pg_enum
    create_enum :pages_statuses, %w(unprocessed processed failed)

    create_table :pages do
      primary_key :id

      column :url,  String, null: false, unique: true
      column :title, String
      column :status, 'pages_statuses', null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
