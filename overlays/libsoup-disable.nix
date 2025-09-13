self: super: {
  libsoup_2_4 = super.stdenv.mkDerivation {
    pname = "libsoup-2.4-disabled"; # <- name of the derivation
    version = "0"; # <- required attribute

    src = null; # <- no source

    buildInputs = [ ];

    buildCommand = ''
      echo "libsoup disabled"
    '';
  };
}
