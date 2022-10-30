{
  description = "Personal website";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    inputs @ { self
    , nixpkgs
    ,
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowInsecure = true;
        };
      };

    in
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          zola
        ];
      };

    };
}
