defmodule Surakitabu.Post do
	use Ecto.Schema
	import Ecto.Changeset

	schema "posts" do
		field :post, :string

		timestamps()
	end

	def changeset(post, params \\%{}) do
		post
		|> cast(params, [:post])
	end
end