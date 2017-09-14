defmodule ThreeScraper do
  @moduledoc """
  Documentation for ThreeScraper.
  """
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end


  def init(_args) do
    {:ok, nil}
  end
end
