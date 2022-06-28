defmodule Rockelivery.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Rockelivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:category, :description, :photo, :price]
  @items_categories [:dessert, :drink, :food]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, Ecto.Enum, values: @items_categories
    field :description, :string
    field :photo, :string
    field :price, :decimal

    many_to_many :orders, Order, join_through: "orders_items"

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
