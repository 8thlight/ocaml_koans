{ pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs.ocamlPackages; [
    ocaml
    findlib # Required to find the rest of the packages
    dune_2
  ];
  buildInputs = with pkgs.ocamlPackages; [
    alcotest
    base
  ];
}
