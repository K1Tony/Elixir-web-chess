defmodule Chess.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias Chess.Accounts.User

  schema "games" do
    field :fen, :string
    field :result, :integer
    field :score, :integer
    
    belongs_to :white, User, foreign_key: :white_id
    belongs_to :black, User, foreign_key: :black_id

    has_many :moves, Chess.Games.Move

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:white_id, :black_id, :result, :score, :fen])
  end
end
