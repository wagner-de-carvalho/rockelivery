defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Error, Repo, User}
  alias Rockelivery.ViaCep.Client
  import Ecto.Changeset

  def call(params) do
    cep = Map.get(params, "cep")
    changeset = User.changeset(params)

    with {:ok, %User{}} <- User.build(changeset),
         {:ok, cep_info} <- Client.get_cep_info(cep),
         {:ok, %User{}} = user <- add_cep_info(changeset, cep_info) do
      user
    else
      {:error, %Error{}} = error -> error
      {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  defp add_cep_info(changeset, %{"logradouro" => address}) do
    changeset
    |> change(address: address)
    |> Repo.insert()
  end

  defp client do
    :rockelivery
    |> Application.fetch_env!(__MODULE__)
    |> Keyword.get(:via_cep_adapter)
  end
end
