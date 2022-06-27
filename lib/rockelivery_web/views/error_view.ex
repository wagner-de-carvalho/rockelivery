defmodule RockeliveryWeb.ErrorView do
  use RockeliveryWeb, :view
  import Ecto.Changeset, only: [traverse_errors: 2]
  alias Ecto.Changeset

  def render("error.json", %{result: %Changeset{} = changeset}) do
    %{message: translate_errors(changeset)}
  end

  def render("error.json", %{result: result}), do: %{message: result}

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", translate_value(value, msg))
      end)
    end)
  end

  defp translate_value({:parameterized, Ecto.Enum, _map}, msg), do: msg
  defp translate_value(value, _msg), do: to_string(value)

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
