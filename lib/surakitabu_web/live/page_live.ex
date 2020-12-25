defmodule SurakitabuWeb.PageLive do
  use SurakitabuWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= f = form_for :post, "#" %>
    <label for="post">create post</label>
    <textarea id="post" name="post"  placeholder="what's on your mind?" autofocus></textarea>
    <%= submit "Post", class: "btn" %>
    </form>
    """
  end
end
