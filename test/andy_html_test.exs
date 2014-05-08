defmodule Andy.HTML.Test do
  
  use Andy.HTML
  use ExUnit.Case

  test "not closing tag with attributes" do
    html = [:img, [src: "/media/doge.png"], nil] |> html
    assert html == "<img src=\"/media/doge.png\">"
  end

  test "not closing tag without attributes" do
    html = [:br, nil] |> html
    assert html == "<br>"
  end

  test "closing tag with attributes" do
    html = [:p, [class: "such-fonts"], "so beautiful"] |> html
    assert html == "<p class=\"such-fonts\">so beautiful</p>"
  end

  test "closing tag without attributes" do
    html = [:p, "wow such paragraph"] |> html
    assert html == "<p>wow such paragraph</p>"
  end

  test "closing tag without body" do
    html = [:p, [class: "important"], []] |> html
    assert html == "<p class=\"important\"></p>"
  end

  test "escaping" do
    escaped = "<script>alert('123');</stript>" |> escape
    assert escaped == "&lt;script&gt;alert(&apos;123&apos;);&lt;/stript&gt;"
  end

end
