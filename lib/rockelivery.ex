defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UsersCreate
  alias Rockelivery.Users.Delete, as: UsersDelete
  alias Rockelivery.Users.Get, as: UsersGet
  alias Rockelivery.Users.Update, as: UsersUpdate

  defdelegate create_user(params), to: UsersCreate, as: :call
  defdelegate delete_user(uuid), to: UsersDelete, as: :call
  defdelegate get_user_by_id(uuid), to: UsersGet, as: :by_id
  defdelegate update_user(params), to: UsersUpdate, as: :call
end
