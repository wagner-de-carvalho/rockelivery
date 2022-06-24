defmodule Rockelivery.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :address, :string
      add :age, :integer
      add :cep, :string
      add :cpf, :string
      add :email, :string
      add :name, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:users, [:cpf])
    create unique_index(:users, [:email])
  end
end
