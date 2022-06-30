defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Error, Repo, User}
  alias Rockelivery.ViaCep.Client
  import Ecto.Changeset

  def call(%{"cep" => cep} = params) do
    with {:ok, %User{} = user} <- User.build(params),
         {:ok, cep_info} <- Client.get_cep_info(cep) do
      create_user(user, cep_info)
    end
  end

  defp create_user(user, %{"logradouro" => address}) do
    user
    |> change(address: address)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{} = user}), do: {:ok, user}

  defp handle_insert({:error, error}) do
    {:error, Error.build(:bad_request, error)}
  end
end
