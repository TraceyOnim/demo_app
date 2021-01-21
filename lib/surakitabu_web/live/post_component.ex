defmodule SurakitabuWeb.PostComponent do
  use Phoenix.LiveComponent
  use Phoenix.HTML

  alias Surakitabu.Post
  alias Surakitabu.Post.Account
  alias Surakitabu.Repo
  alias SurakitabuWeb.Router.Helpers, as: Routes

  def preload(list_of_assigns) do
    list_of_assigns |> Enum.map(fn assigns -> Map.put(assigns, :all_posts, Repo.all(Post)) end)
  end

  def render(assigns) do
    ~L"""
    <div>
    <%= f = form_for :post, "#", [phx_submit: :post, phx_target: @myself] %>
    <label for="post">create post</label>
    <textarea id="post" name="post"  placeholder="what's on your mind?" autofocus></textarea>
    <%= submit "Post", class: "btn" %>
    </form>
    </div>
    <%= unless Enum.empty?(@all_posts) do %>
    <div>
      <%= for post <- @all_posts do %>
        <p><%= post.post %></p>
      <% end %>
    </div>
    <% end %>
    """
  end

  def handle_event("post", params, socket) do
    {:noreply,
     socket |> _save_post(params) |> push_redirect(to: Routes.page_path(socket, :index))}
  end

  defp _save_post(socket, params) do
    case Account.create_post(params) do
      {:ok, _} ->
        socket
        |> put_flash(:info, "post created successfully")

      {:error, _} ->
        socket
        |> put_flash(:error, "Something went wrong, Try Again")
    end
  end
end
