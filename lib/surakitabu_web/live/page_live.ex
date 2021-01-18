defmodule SurakitabuWeb.PageLive do
  use SurakitabuWeb, :live_view

  alias Surakitabu.Post

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(posts: Surakitabu.Repo.all(Post))}
  end
end
