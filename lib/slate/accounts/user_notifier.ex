defmodule Slate.Accounts.UserNotifier do
  @moduledoc """
  User email notifications.

  Layout: `email.html`
  """

  use Bamboo.Phoenix, view: SlateWeb.Users.EmailView

  alias Slate.Accounts.User
  alias Slate.Mailer

  @from "team@slate.ws"
  @reply_to "team@slate.ws"

  @type uri_type :: nil | URL.Data.t() | URL.Geo.t() | URL.Tel.t() | URL.UUID.t() | URL.Mailto.t()

  @doc """
  Deliver generated email.
  """
  @spec deliver(Bamboo.Email.t()) :: {atom(), map()}
  def deliver(email) do
    Mailer.deliver_later(email)
    {:ok, %{to: email.to, body: email.html_body}}
  end

  @doc """
  Deliver instructions to confirm account.
  """
  @spec deliver_confirmation_instructions(User.t(), uri_type()) :: {atom(), map()}
  def deliver_confirmation_instructions(user, url) do
    base_email()
    |> to(user.email)
    |> subject("Confirm Your Account")
    |> assign(:user, user)
    |> assign(:url, url)
    |> render(:confirmation_instructions)
    |> deliver()
  end

  @doc """
  Deliver instructions to reset password account.
  """
  @spec deliver_reset_password_instructions(User.t(), uri_type()) :: {atom(), map()}
  def deliver_reset_password_instructions(user, url) do
    base_email()
    |> to(user.email)
    |> subject("Reset Your Password")
    |> assign(:user, user)
    |> assign(:url, url)
    |> render(:reset_password_instructions)
    |> deliver()
  end

  @doc """
  Deliver instructions to update your e-mail.
  """
  @spec deliver_update_email_instructions(User.t(), uri_type()) :: {atom(), map()}
  def deliver_update_email_instructions(user, url) do
    base_email()
    |> to(user.email)
    |> subject("Confirm Email Address")
    |> assign(:user, user)
    |> assign(:url, url)
    |> render(:update_email_instructions)
    |> deliver()
  end

  defp base_email do
    new_email()
    |> from(@from)
    |> put_header("Reply-To", @reply_to)
    |> put_html_layout({SlateWeb.LayoutView, "email.html"})
  end
end
