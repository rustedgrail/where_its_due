defmodule WhereItsDue.FranchiseView do
  use WhereItsDue.Web, :view

  def render("index.json", %{franchises: franchises}) do
    %{data: render_many(franchises, WhereItsDue.FranchiseView, "franchise.json")}
  end

  def render("show.json", %{franchise: franchise}) do
    %{data: render_one(franchise, WhereItsDue.FranchiseView, "franchise.json")}
  end

  def render("franchise.json", %{franchise: franchise}) do
    %{id: franchise.id,
      name: franchise.name,
      deck: franchise.deck,
      description: franchise.description,
      giant_bomb_id: franchise.giant_bomb_id}
  end
end
