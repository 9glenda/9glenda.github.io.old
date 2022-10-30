{ pkgs, stdenv, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "9glenda-site";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ pkgs.zola ];
  buildPhase = ''
    zola build
  '';
  installPhase = ''
    cp -r public $out
    touch public/.nojekyll
  '';
}
