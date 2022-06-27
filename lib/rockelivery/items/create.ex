defmodule Rockelivery.Items.Create do
  alias Rockelivery.{Error, Item, Repo}

  def call(params) do
    params
    |> Item.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Item{} = item}), do: {:ok, item}

  defp handle_insert({:error, error}) do
    {:error, Error.build(:bad_request, error)}
  end
end
