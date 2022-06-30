defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo
  alias Rockelivery.User

  def user_params_factory do
    %{
      age: 30,
      address: "Rua ABC",
      cep: "29160100",
      cpf: "00100200300",
      email: "fulano@mail.com",
      name: "Fulano",
      password: "1234567"
    }
  end

  def user_string_params_factory do
    %{
      "age" => 30,
      "address" => "Rua ABC",
      "cep" => "29160325",
      "cpf" => "00100200300",
      "email" => "fulano@mail.com",
      "name" => "Fulano",
      "password" => "1234567"
    }
  end

  def user_factory do
    %User{
      age: 30,
      address: "Rua ABC",
      cep: "29160100",
      cpf: "00100200300",
      email: "fulano@mail.com",
      name: "Fulano",
      password: "1234567",
      id: "7d412f02-e3cc-4603-8ce3-d431fe888401"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
