defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UsersCreate
  alias Rockelivery.Users.Get, as: UsersGet

  defdelegate create_user(params) , to: UsersCreate, as: :call
  defdelegate get_user(uuid) , to: UsersGet, as: :by_id
end
