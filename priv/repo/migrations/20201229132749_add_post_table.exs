defmodule Surakitabu.Repo.Migrations.AddPostTable do
  use Ecto.Migration

  def change do
  	create table("posts") do
  		add :post, :text

  		timestamps()
  	end

  end
end
