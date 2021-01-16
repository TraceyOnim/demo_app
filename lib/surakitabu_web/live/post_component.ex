defmodule SurakitabuWeb.PostComponent do
  use Phoenix.LiveComponent
  use Phoenix.HTML

  def render(assigns) do
    ~L"""
    <div>
    <%= f = form_for :post, "#", [phx_submit: :post] %>
    <label for="post">create post</label>
    <textarea id="post" name="post"  placeholder="what's on your mind?" autofocus></textarea>
    <%= submit "Post", class: "btn" %>
    </form>
    </div>
    """
  end
end
