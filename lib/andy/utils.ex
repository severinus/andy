defmodule Andy.Utils do

  def render_attrs([]) do
    nil
  end

  def render_attrs(attrs) do
    " " <> Enum.map_join(attrs, " ", fn ({key, value}) ->"#{key}=\"#{value}\"" end)
  end

  def render_body([tag, nil]) when is_atom(tag) do
    "<#{tag}>"
  end

  def render_body([tag, body]) when is_atom(tag) do
    "<#{tag}>#{render_body(body)}</#{tag}>"
  end

  def render_body([tag, attrs, nil]) when is_atom(tag) do
    "<#{tag}#{render_attrs(attrs)}>"
  end

  def render_body([tag, attrs, body]) when is_atom(tag) do
    "<#{tag}#{render_attrs(attrs)}>#{render_body(body)}</#{tag}>"
  end

  def render_body(body) when is_list(body) do
    Enum.map_join(body, &(render_body &1))
  end

  def render_body(tag) when is_atom(tag) do
    render_body([tag, []])
  end

  def render_body(tag) do
    tag
  end

end
