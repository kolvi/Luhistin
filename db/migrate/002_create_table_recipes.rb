Sequel.migration do
  change do
    create_table(:recipes) do
      primary_key :id
      String :name, size: 50, unique: true, null: false
      jsonb :distortions, null: false
    end
  end
end
