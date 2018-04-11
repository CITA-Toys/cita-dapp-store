defmodule CitaDappStoreWeb.ArticleController do
  use CitaDappStoreWeb, :controller
  plug(:put_layout, "plain.html")

  alias CitaDappStore.Posts
  alias CitaDappStore.Posts.Article

  def index(conn, _params) do
    articles = Posts.list_articles()
    render(conn, "index.html", articles: articles)
  end

  def new(conn, _params) do
    changeset = Posts.change_article(%Article{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"article" => article_params}) do
    case Posts.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: article_path(conn, :show, article))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Posts.get_article!(id)
    render(conn, "show.html", article: article)
  end

  def edit(conn, %{"id" => id}) do
    article = Posts.get_article!(id)
    changeset = Posts.change_article(article)
    render(conn, "edit.html", article: article, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Posts.get_article!(id)

    case Posts.update_article(article, article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: article_path(conn, :show, article))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", article: article, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Posts.get_article!(id)
    {:ok, _article} = Posts.delete_article(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: article_path(conn, :index))
  end

  defp verify_addr(conn, article_params) do
    if Map.get(article_params, :address) !== "chenyu_addr" do
      changeset =
        %Article{}
        |> Article.changeset(article_params)

      conn
      |> put_flash(:error, "Not Chenyu")
      |> render("new.html", changeset: changeset)
    end

    conn
  end
end
