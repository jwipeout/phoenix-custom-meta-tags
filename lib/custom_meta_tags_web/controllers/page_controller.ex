defmodule CustomMetaTagsWeb.PageController do
  use CustomMetaTagsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
