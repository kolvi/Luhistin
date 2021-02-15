Sequel.migration do
  change do
    create_table(:sourcetexts) do
      primary_key :id
      String :name, size: 50, unique: true, null: false
      String :content, null: false
    end
  end
end
