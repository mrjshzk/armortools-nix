{
  description = "ArmorPaint dev shell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    devShells.${system}.default = pkgs.mkShell {
      nativeBuildInputs = with pkgs; [
        gnumake
        pkg-config
      ];

      buildInputs = with pkgs; [
        clang
        gtk3
        gdk-pixbuf
        openssl
        openssl.dev
        openssl.out

        vulkan-headers
        vulkan-loader

        xorg.libX11
        xorg.libXi
        xorg.libXrandr
        xorg.libXcursor
      ];
      shellHook = ''
        unset MAKEFLAGS

        gtk_cflags="$(pkg-config --cflags gtk+-3.0)"
        gtk_libs="$(pkg-config --libs gtk+-3.0)"

        MAKEFLAGS=""
        for t in $gtk_cflags; do
          MAKEFLAGS="$MAKEFLAGS CPPFLAGS+=$t CFLAGS+=$t"
        done
        for t in $gtk_libs; do
          MAKEFLAGS="$MAKEFLAGS LIB+=$t"
        done
        for t in -lXi -lXrandr -lXcursor -lX11 -lvulkan -lssl -lcrypto; do
          MAKEFLAGS="$MAKEFLAGS LIB+=$t"
        done
        export MAKEFLAGS
      '';
    };
  };
}
