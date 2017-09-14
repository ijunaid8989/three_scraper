defmodule ThreeScraper do
  @moduledoc """
  Documentation for ThreeScraper.
  """
  use GenServer
  require Logger
  alias ThreeScraper.{SIM, Repo}

  @period 60 * 60 * 1000 # one hour

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end


  def init(_args) do
    Process.send_after(self(), :work, 10 * 1000)
    {:ok, nil}
  end

  def handle_info(:work, state) do
    sims = SIM.get_info() |> Enum.map(&Map.from_struct/1)
    Repo.insert_all("sim_logs", sims)
    Process.send_after(self(), :work, 10 * 1000)
    {:noreply, state}
  end

  def handle_info(msg, state) do
    Logger.error([to_string(__MODULE__), " unhandled message", ?\n, inspect(msg)])
    {:noreply, state}
  end
end
