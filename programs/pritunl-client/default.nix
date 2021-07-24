{ pkgs ? import <nixpkgs> {} }:



let
  version = "1.2.2799.2";
in
pkgs.stdenv.mkDerivation rec {
  name = "pritunl-client-electron";
  inherit version;

  src = pkgs.fetchurl {
    url = "https://github.com/pritunl/pritunl-client-electron/releases/download/${version}/pritunl-client-electron_${version}-0debian1.buster_amd64.deb";
    sha256 = "0df42cswlblhhbyx6ffm9a3ml0h8jxg0x9i43nhshwpghp6sw0d3";
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
  ];

  buildInputs = [
    pkgs.alsaLib
    pkgs.openssl
    pkgs.zlib
  ];

  sourceRoot = ".";

  installPhase = ''
    install -m755 -D pritunl-client-electron_${version}-0debian1.buster_amd64 $out/bin/studio-link
  '';

  meta = with pkgs.lib; {
    homepage = "https://client.pritunl.com";
    description = "vpntool";
    platforms = platforms.linux;
  };
}
