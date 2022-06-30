defmodule Rockelivery.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:address, :age, :cep, :cpf, :email, :name, :password]
  @derive {Jason.Encoder, only: [:address, :age, :cpf, :email, :id]}

  schema "users" do
    field :address, :string
    field :age, :integer
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    has_many :orders, Order

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:create)
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> validate_length(:cep, is: 8)
    |> validate_length(:cpf, is: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: false} = changeset), do: changeset

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end
end
