defmodule Chess.GamesTest do
  use Chess.DataCase

  alias Chess.Games

  describe "games" do
    alias Chess.Games.Game

    import Chess.GamesFixtures

    @invalid_attrs %{fen: nil, pen: nil, result: nil, score: nil}

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{fen: "some fen", pen: "some pen", result: 42, score: 42}

      assert {:ok, %Game{} = game} = Games.create_game(valid_attrs)
      assert game.fen == "some fen"
      assert game.pen == "some pen"
      assert game.result == 42
      assert game.score == 42
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      update_attrs = %{fen: "some updated fen", pen: "some updated pen", result: 43, score: 43}

      assert {:ok, %Game{} = game} = Games.update_game(game, update_attrs)
      assert game.fen == "some updated fen"
      assert game.pen == "some updated pen"
      assert game.result == 43
      assert game.score == 43
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end

  describe "pens" do
    alias Chess.Games.PEN

    import Chess.GamesFixtures

    @invalid_attrs %{move: nil, white_move: nil, black_move: nil}

    test "list_pens/0 returns all pens" do
      pen = pen_fixture()
      assert Games.list_pens() == [pen]
    end

    test "get_pen!/1 returns the pen with given id" do
      pen = pen_fixture()
      assert Games.get_pen!(pen.id) == pen
    end

    test "create_pen/1 with valid data creates a pen" do
      valid_attrs = %{move: 42, white_move: "some white_move", black_move: "some black_move"}

      assert {:ok, %PEN{} = pen} = Games.create_pen(valid_attrs)
      assert pen.move == 42
      assert pen.white_move == "some white_move"
      assert pen.black_move == "some black_move"
    end

    test "create_pen/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_pen(@invalid_attrs)
    end

    test "update_pen/2 with valid data updates the pen" do
      pen = pen_fixture()
      update_attrs = %{move: 43, white_move: "some updated white_move", black_move: "some updated black_move"}

      assert {:ok, %PEN{} = pen} = Games.update_pen(pen, update_attrs)
      assert pen.move == 43
      assert pen.white_move == "some updated white_move"
      assert pen.black_move == "some updated black_move"
    end

    test "update_pen/2 with invalid data returns error changeset" do
      pen = pen_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_pen(pen, @invalid_attrs)
      assert pen == Games.get_pen!(pen.id)
    end

    test "delete_pen/1 deletes the pen" do
      pen = pen_fixture()
      assert {:ok, %PEN{}} = Games.delete_pen(pen)
      assert_raise Ecto.NoResultsError, fn -> Games.get_pen!(pen.id) end
    end

    test "change_pen/1 returns a pen changeset" do
      pen = pen_fixture()
      assert %Ecto.Changeset{} = Games.change_pen(pen)
    end
  end

  describe "moves" do
    alias Chess.Games.Move

    import Chess.GamesFixtures

    @invalid_attrs %{move: nil, white_move: nil, black_move: nil}

    test "list_moves/0 returns all moves" do
      move = move_fixture()
      assert Games.list_moves() == [move]
    end

    test "get_move!/1 returns the move with given id" do
      move = move_fixture()
      assert Games.get_move!(move.id) == move
    end

    test "create_move/1 with valid data creates a move" do
      valid_attrs = %{move: 42, white_move: "some white_move", black_move: "some black_move"}

      assert {:ok, %Move{} = move} = Games.create_move(valid_attrs)
      assert move.move == 42
      assert move.white_move == "some white_move"
      assert move.black_move == "some black_move"
    end

    test "create_move/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_move(@invalid_attrs)
    end

    test "update_move/2 with valid data updates the move" do
      move = move_fixture()
      update_attrs = %{move: 43, white_move: "some updated white_move", black_move: "some updated black_move"}

      assert {:ok, %Move{} = move} = Games.update_move(move, update_attrs)
      assert move.move == 43
      assert move.white_move == "some updated white_move"
      assert move.black_move == "some updated black_move"
    end

    test "update_move/2 with invalid data returns error changeset" do
      move = move_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_move(move, @invalid_attrs)
      assert move == Games.get_move!(move.id)
    end

    test "delete_move/1 deletes the move" do
      move = move_fixture()
      assert {:ok, %Move{}} = Games.delete_move(move)
      assert_raise Ecto.NoResultsError, fn -> Games.get_move!(move.id) end
    end

    test "change_move/1 returns a move changeset" do
      move = move_fixture()
      assert %Ecto.Changeset{} = Games.change_move(move)
    end
  end
end
