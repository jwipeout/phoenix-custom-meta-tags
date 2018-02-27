# Custom Meta Tags Phoenix Elixir App

There are several approaches to creating custom meta tags for individual templates, but I found this one the most helpful. It involves using html partials that overide the default meta tags that are used inside the layout file.

## Update Phoenix.View to use pattern to compile templates inside of subdirectories

```elixir
# lib/custom_meta_tags_web.ex

def view do
  quote do
    use Phoenix.View, root: "lib/custom_meta_tags_web/templates",
                      pattern: "**/*",
                      namespace: CustomMetaTagsWeb

    # Import convenience functions from controllers
    import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

    # Use all HTML functionality (forms, tags, etc)
    use Phoenix.HTML

    import CustomMetaTagsWeb.Router.Helpers
    import CustomMetaTagsWeb.ErrorHelpers
    import CustomMetaTagsWeb.Gettext
  end
end
```

## Update layout file to use default meta tags

```elixir
<!-- templates/layout/app.html.eex -->

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <%= render_existing(@view_module, "meta/meta." <> @view_template, assigns) ||
      render(CustomMetaTagsWeb.LayoutView, "meta.html", assigns) %>

  <link rel="stylesheet" href="<%= static_path(@conn, "/css/app.css") %>">
</head>
```

## Add default meta tags

```html
<!-- templates/layout/meta.html.eex -->

<title>Default title</title>
```

## Add meta directory to template directory

Override the default meta tags by creating a meta subdirectory and placing files that correspond to the template.

```html
<!-- templates/page/meta/meta.about.html.eex -->

<title>About title</title>
```
