defmodule Rockelivery.Orders.ReportRunner do
  use GenServer
  require Logger
  alias Rockelivery.Orders.Report

  @impl true
  def init(state) do
    schedule_report_generation()
    {:ok, state}
  end

  def start_link(_initial_value) do
    Logger.info("Start ReportRunner ...", ansi_color: :blue)
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def handle_info(:generate, state) do
    Logger.info("Generate Report ...", ansi_color: :blue)
    Report.create()
    schedule_report_generation()
    {:noreply, state}
  end

  defp schedule_report_generation do
    Process.send_after(self(), :generate, 1000 * 60)
  end
end
