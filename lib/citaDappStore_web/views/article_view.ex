defmodule CitaDappStoreWeb.ArticleView do
  use CitaDappStoreWeb, :view

  def timeFormatter(time) do
    "#{time.year}-#{time.month}-#{time.day} #{time.hour}:#{time.minute}"
  end
end
