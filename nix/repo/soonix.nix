{
  inputs,
  cell,
  ...
}: let
  inherit (inputs) soonix kenchiku;
  inherit (cell) ci;
in
  (soonix.make {
    hooks = {
      luarc = {
        output = ".luarc.json";
        data = {
          "$schema" = "https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json";
          workspace.library = [
            "${kenchiku.packages.default}/share/kenchiku/schema.lua"
          ];
        };
        hook.mode = "copy";
        opts.format = "json";
      };
      ci = ci.soonix;
      renovate = {
        output = ".gitlab/renovate.json5";
        data = {
          extends = ["config:recommended"];
          postUpgradeTasks = {
            commands = [
              "nix-portable nix run .#soonix:update"
            ];
            executionMode = "branch";
          };
          lockFileMaintenance = {
            enabled = true;
            extends = ["schedule:monthly"];
          };
          nix.enabled = true;
          gitlabci.enabled = false;
        };
        hook = {
          mode = "copy";
          gitignore = false;
        };
        opts.format = "json";
      };
    };
  }).config
