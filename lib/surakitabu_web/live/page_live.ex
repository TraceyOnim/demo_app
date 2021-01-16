defmodule SurakitabuWeb.PageLive do
  use SurakitabuWeb, :live_view
  alias Surakitabu.Post.Account

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_event("post", params, socket) do
    case Account.create_post(params) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "post created successfully")
         |> push_redirect(to: "/")}

      {:error, _} ->
        {:noreply,
         socket
         |> put_flash(:error, "Something went wrong, Try Again")
         |> push_redirect(to: "/")}
    end
  end
end
