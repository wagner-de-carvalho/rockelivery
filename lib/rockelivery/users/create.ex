defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Error, Repo, User}
  alias Rockelivery.ViaCep.Client

  def call(%{"cep" => cep} = params) do
    case Client.get_cep_info(cep) do
      {:ok, cep_info} -> create_user(params, cep_info)
      {:error, _result} = error -> error
    end
  end

  defp create_user(params, cep_info) do
    params
    |> add_cep_info(cep_info)
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp add_cep_info(params, %{"logradouro" => address}) do
    %{params | "address" => address}
  end

  defp handle_insert({:ok, %User{} = user}), do: {:ok, user}

  defp handle_insert({:error, error}) do
    {:error, Error.build(:bad_request, error)}
  end
end
