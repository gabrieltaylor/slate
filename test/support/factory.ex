defmodule Slate.Factory do
  use ExMachina.Ecto, repo: Slate.Repo
  use Slate.AccountsFactory
end
