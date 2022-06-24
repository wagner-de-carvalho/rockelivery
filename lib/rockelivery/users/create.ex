defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Repo, User}
  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = user}), do: user

  defp handle_insert({:error, error}) do
    {:error, %{status: :bad_request, result: error}}
  end
end
