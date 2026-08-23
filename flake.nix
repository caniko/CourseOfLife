{
  description = "Public generic CV publication frontend";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    tex-harbor = {
      url = "git+https://github.com/caniko/harbor-tex.git?ref=trunk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, flake-utils, tex-harbor, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        cv = tex-harbor.lib.mkLatexDocument {
          inherit pkgs;
          name = "cv";
          src = ./.;
          mainFile = "cv.tex";
          engine = "pdflatex";
          profile = "cv";
          nativeBuildInputs = [ pkgs.poppler-utils ];
          outputName = "cv.pdf";
          postBuild = ''
            pages=$(${pkgs.poppler-utils}/bin/pdfinfo cv.pdf | ${pkgs.gawk}/bin/awk '/^Pages:/ {print $2}')
            test "$pages" -le 2
          '';
        };
      in
      {
        packages = {
          inherit cv;
          default = cv;
        };
        checks.cv = cv;
        devShells.default = tex-harbor.lib.mkTexDevShell {
          inherit pkgs;
          profile = "cv";
        };
      }
    );
}
