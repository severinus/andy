# Andy

Like [hiccup](https://github.com/weavejester/hiccup), but for Elixir. 

```elixir
import Andy.HTML

[:p, "Hullo Mike?"] |> html
# => <p>Hullo Mike?</p>
[:p, [class: "mike"], "Hello Joe?"] |> html
# => <p class="mike">Hello Joe?</p>
[:input, [type: "text", name: "username"], nil] |> html
# => <input type="text" name="username">
```
