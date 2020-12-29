defmodule Surakitabu.Post.Account do
	@moduledoc """
   Post context that entails every operation related to post.
	"""
	alias Surakitabu.Post
	alias Surakitabu.Repo


	@doc """
	saves post into the database
	"""
    @spec create_post(map()) :: {:ok, %Post{}} | {:error, Ecto.Changeset.t()}
	def create_post(attrs) do
		%Post{}
		|> Post.changeset(attrs)
		|> Repo.insert()
	end
end