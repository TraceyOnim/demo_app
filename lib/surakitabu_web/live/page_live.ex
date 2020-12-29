defmodule SurakitabuWeb.PageLive do
  use SurakitabuWeb, :live_view
  use Phoenix.HTML
  alias Surakitabu.Post.Account

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

  def handle_event("post", params, socket) do
    case Account.create_post(params) do
       {:ok, _} ->
        {:noreply, 
        socket
        |> put_flash(:info, "post created successfully")
        |> push_redirect(to: "/")
      }

      {:error, _} ->
        {:noreply, 
        socket
        |> put_flash(:error, "Something went wrong, Try Again")
        |> push_redirect(to: "/")
      }
        
    end 
  end
end
