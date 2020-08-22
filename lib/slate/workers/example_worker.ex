defmodule Slate.ExampleWorker do
  @moduledoc """
  An Example worker to be used to create meaningful workers
  """
  use Oban.Worker, queue: :default

  require Logger

  @doc """
  Enqueues a example job that logs the args.
  """
  @spec enqueue(String.t()) ::
          {:ok, Oban.Job.t()} | {:error, Ecto.Changeset.t()}
  def enqueue(message) do
    %{message: message}
    |> new()
    |> Oban.insert()
  end

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"message" => message}}) do
    Logger.info("#{__MODULE__} ran with message: #{message}")
    :ok
  end
end
