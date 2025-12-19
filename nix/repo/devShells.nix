{
  inputs,
  cell,
  ...
}: let
  inherit (inputs) pkgs devshell treefmt kenchiku devtools-lib;
  inherit (cell) soonix;
  treefmtWrapper = treefmt.mkWrapper pkgs {
    projectRootFile = "flake.nix";
    programs = {
      alejandra.enable = true;
      mdformat.enable = true;
      stylua.enable = true;
    };
    settings.formatter.mdformat.command = let
      pkg = pkgs.python3.withPackages (p: [
        p.mdformat
        p.mdformat-mkdocs
      ]);
    in "${pkg}/bin/mdformat";
  };
in {
  default = devshell.mkShell {
    imports = [soonix.devshellModule devtools-lib.devshellModule];
    packages = [
      pkgs.lua-language-server
      kenchiku.packages.default
      treefmtWrapper
    ];
    env."KENCHIKU_PATH".eval = "$REN_ROOT";
    lefthook.config = {
      "pre-commit" = {
        parallel = true;
        jobs = [
          {
            name = "treefmt";
            stage_fixed = true;
            run = "${treefmtWrapper}/bin/treefmt";
            env.TERM = "dumb";
          }
          {
            name = "soonix";
            stage_fixed = true;
            run = "${soonix.packages."soonix:update"}/bin/soonix:update";
          }
        ];
      };
    };
  };
}
