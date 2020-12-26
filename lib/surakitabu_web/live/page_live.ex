defmodule SurakitabuWeb.PageLive do
  use SurakitabuWeb, :live_view
  use Phoenix.HTML

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(post: "")}
  end

  def render(assigns) do
    ~L"""
    <%= f = form_for :post, "#", [phx_submit: :post] %>
    <label for="post">create post</label>
    <textarea id="post" name="post"  placeholder="what's on your mind?" autofocus></textarea>
    <%= submit "Post", class: "btn" %>
    </form>
    <p><%= @post %></p>
    """
  end

  def handle_event("post", %{"post" => post}, socket) do
    {:noreply, socket |> assign(post: post)}
  end
end
