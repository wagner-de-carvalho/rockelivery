defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UsersCreate

  defdelegate create_user(params) , to: UsersCreate, as: :call
end
