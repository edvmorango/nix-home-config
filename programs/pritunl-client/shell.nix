let
  nixpkgs = import <nixpkgs> {};
  stdenv = nixpkgs.stdenv;
in
rec {
  dumb-hello = stdenv.mkDerivation {
    name = "dumb-hello";
    builder = ./builder.sh;
    dpkg = nixpkgs.dpkg;
    src = nixpkgs.fetchurl {
      url = "http://ftp.us.debian.org/debian/pool/main/h/hello-traditional/hello-traditional_2.9-2_amd64.deb";
      md5 = "f5f3c28b65221dae44dda6f242c23316";
    };
  };
  full-hello = nixpkgs.buildFHSUserEnv {
    name = "full-hello";
    targetPkgs = pkgs: [ dumb-hello ];
    multiPkgs = pkgs: [ pkgs.dpkg ];
    runScript = "hello";
  };
}
