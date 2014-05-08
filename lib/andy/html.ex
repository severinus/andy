defmodule Andy.HTML do

  @doctype "<!DOCTYPE html>"

  defmacro __using__(_) do
    quote do
      import Andy.HTML
    end
  end

  def html(body) do
    body |> Andy.Utils.render_body
  end

  def html5(body) do
    body = [:html, [], body] |> Andy.Utils.render_body
    @doctype <> body
  end

  def escape(body) do
    body
    |> String.replace("&", "&amp;")
    |> String.replace("\"", "&quot;")
    |> String.replace("'", "&apos;")
    |> String.replace("<", "&lt;")
    |> String.replace(">", "&gt;")
  end

end
