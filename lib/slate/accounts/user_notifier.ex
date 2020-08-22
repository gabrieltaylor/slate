defmodule Slate.Accounts.UserNotifier do
  @moduledoc false
  use Bamboo.Phoenix, view: SlateWeb.EmailView
  alias Slate.Mailer

  @from "team@slate.ws"
  @reply_to "team@slate.ws"

  @doc """
  Deliver instructions to confirm account.
  """
  def deliver_confirmation_instructions(user, url) do
    base_email()
    |> to(user)
    |> subject("Confirm Your Account")
    |> assign(:user, user)
    |> assign(:url, url)
    |> render(:confirmation_instructions)
    |> Mailer.deliver_now()
  end

  @doc """
  Deliver instructions to reset password account.
  """
  def deliver_reset_password_instructions(user, url) do
    base_email()
    |> to(user)
    |> subject("Reset Your Password")
    |> assign(:user, user)
    |> assign(:url, url)
    |> render(:reset_password_instructions)
    |> Mailer.deliver_now()
  end

  @doc """
  Deliver instructions to update your e-mail.
  """
  def deliver_update_email_instructions(user, url) do
    base_email()
    |> to(user)
    |> subject("Confirm Email Address")
    |> assign(:user, user)
    |> assign(:url, url)
    |> render(:update_email_instructions)
    |> Mailer.deliver_now()
  end

  defp base_email do
    new_email()
    |> from(@from)
    |> put_header("Reply-To", @reply_to)
    |> put_html_layout({SlateWeb.LayoutView, "email.html"})
  end
end
