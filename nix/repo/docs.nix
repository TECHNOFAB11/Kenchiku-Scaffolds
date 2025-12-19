{inputs, ...}: let
  inherit (inputs) doclib;
in
  (doclib.mkDocs {
    docs."default" = {
      base = "${inputs.self}";
      path = "${inputs.self}/docs";
      material = {
        enable = true;
        colors = {
          primary = "black";
          accent = "yellow";
        };
        umami = {
          enable = true;
          src = "https://analytics.tf/umami";
          siteId = "0f71fba4-3b42-4e3a-af71-2d12b7ccc3c8";
          domains = ["scaffolds.kenchiku.projects.tf"];
        };
      };
      config = {
        site_name = "Kenchiku Scaffolds";
        site_url = "https://scaffolds.kenchiku.projects.tf";
        repo_name = "TECHNOFAB/kenchiku-scaffolds";
        repo_url = "https://gitlab.com/TECHNOFAB/kenchiku-scaffolds";
        extra_css = ["style.css"];
        theme = {
          logo = "images/logo.svg";
          icon.repo = "simple/gitlab";
          favicon = "images/logo.svg";
        };
        nav = [
          {"Introduction" = "index.md";}
          {
            "Scaffolds" = [
              {"Documents" = "scaffolds/documents.md";}
            ];
          }
        ];
        markdown_extensions = [
          {
            "pymdownx.highlight".pygments_lang_class = true;
          }
          "pymdownx.inlinehilite"
          "pymdownx.snippets"
          "pymdownx.superfences"
          "pymdownx.escapeall"
          "fenced_code"
          "admonition"
        ];
      };
    };
  }).packages
