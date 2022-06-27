defmodule Rockelivery do
  alias Rockelivery.Items.Create, as: ItemCreate
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Delete, as: UserDelete
  alias Rockelivery.Users.Get, as: UserGet
  alias Rockelivery.Users.Update, as: UserUpdate

  defdelegate create_item(params), to: ItemCreate, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(uuid), to: UserDelete, as: :call
  defdelegate get_user_by_id(uuid), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call
end
