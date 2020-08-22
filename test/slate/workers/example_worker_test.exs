defmodule Slate.ExampleWorkerTest do
  use Slate.DataCase, async: true
  @moduletag :capture_log
  use Oban.Testing, repo: Slate.Repo

  import ExUnit.CaptureLog

  alias Slate.ExampleWorker

  @message "Hello from ExampleWorker!"

  setup do
    old_level = Logger.level()
    Logger.configure(level: :info)

    on_exit(fn ->
      Logger.configure(level: old_level)
    end)
  end

  describe "perform/1" do
    test "logs message from args" do
      args = %{message: @message}
      assert :ok == perform_job(ExampleWorker, args)

      assert capture_log(fn ->
               perform_job(ExampleWorker, args)
             end) =~ @message
    end
  end
end
