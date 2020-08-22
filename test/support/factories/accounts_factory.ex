defmodule Slate.AccountsFactory do
  @moduledoc """
  Accounts Factory
  """
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        %Slate.Accounts.User{
          email: Faker.Internet.free_email(),
          hashed_password: "$2b$12$6C2w9e73YaJEUy8JITa...MgQpo8.hWfFm0SRQq7ZplP7VBpMKURy",
          confirmed_at: DateTime.now!("Etc/UTC")
        }
      end

      def unique_user_email, do: Faker.Internet.free_email()
      def valid_user_password, do: "123123"

      def extract_user_token(fun) do
        {:ok, captured} = fun.(&"[TOKEN]#{&1}[TOKEN]")
        [_, token, _] = String.split(captured.body, "[TOKEN]")
        token
      end
    end
  end
end
