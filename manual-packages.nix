let
  unstable = import (import ./unstable-packages.nix) {};
  mbt =

    unstable.buildGoModule rec {
      pname = "mbt";
      version = "0.24";

      src = unstable.fetchFromGitHub {
        owner = "mbtproject";
        repo = pname;
        rev = "7de0bc6974cb802dc5f20a1f6da89fb88470ede8";
        sha256 = "04vchr7gxj3vnm3fgcyqky8n2h759ir20jwf3wxl4m1r5b9zwhky";
      };
      runVend = true;


      vendorSha256 = null;
      meta = with unstable.stdenv.lib; {
        description = " Command line todo list with super-reliable git sync";
        homepage = src.meta.homepage;
        license = licenses.mit;
        platforms = platforms.linux;
      };
    };
in
mbt
