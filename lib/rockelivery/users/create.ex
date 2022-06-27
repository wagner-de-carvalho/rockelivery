defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = user}), do: {:ok, user}

  defp handle_insert({:error, error}) do
    {:error, Error.build(:bad_request, error)}
  end
end
