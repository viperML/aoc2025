with import <nixpkgs> { };
mkShell.override { stdenv = clangStdenv; } {
  packages = [
    cmake
    aoc-cli
    clang-tools
  ];
  hardeningDisable = [ "all" ];
}
