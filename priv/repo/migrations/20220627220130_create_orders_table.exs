defmodule Rockelivery.Repo.Migrations.CreateOrdersTable do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :address, :string
      add :comments, :string
      add :payment_method, :payment_method
      add :user_id, references(:users, type: :binary_id)

      timestamps()
    end
  end
end
