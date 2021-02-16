{ pkgs, ... }:

let
  alacritty-ligature = pkgs.callPackage (
    { stdenv
    , lib
    , fetchFromGitHub
    , rustPlatform

    , cmake
    , gzip
    , installShellFiles
    , makeWrapper
    , ncurses
    , pkgconfig
    , python3

    , expat
    , fontconfig
    , freetype
    , libGL
    , libX11
    , libXcursor
    , libXi
    , libXrandr
    , libXxf86vm
    , libxcb
    , libxkbcommon
    , wayland
    , xdg_utils

    }:
      let
        rpathLibs = [
          expat
          fontconfig
          freetype
          libGL
          libX11
          libXcursor
          libXi
          libXrandr
          libXxf86vm
          libxcb
        ] ++ lib.optionals stdenv.isLinux [
          libxkbcommon
          wayland
        ];
      in
        rustPlatform.buildRustPackage rec {
          pname = "alacritty";
          version = "v0.3.3-478-g05307f8";

          src = fetchFromGitHub {
            owner = "zenixls2";
            repo = "alacritty";
            rev = "05307f8782ae0c94da5ff7b4bab2d1a51a50a70a";
            sha256 = "1acw7h92k75i9a8svaa8gxyjx57758vx5c237iq5q9i00s0a5ksq";
          };

          cargoSha256 = "16c5lqi1jdjx1kxzq9gj1mrxii2vicpqd1bijy8q0rv97628d7qq";

          nativeBuildInputs = [
            cmake
            gzip
            installShellFiles
            makeWrapper
            ncurses
            pkgconfig
            python3

          ];

          buildInputs = rpathLibs;
          rPath = stdenv.lib.makeLibraryPath rpathLibs + ":${stdenv.cc.cc.lib}/lib64";
          outputs = [ "out" "terminfo" ];

          postPatch = ''
            substituteInPlace alacritty/src/config/mouse.rs \
              --replace xdg-open ${xdg_utils}/bin/xdg-open
          '';

          installPhase = ''
            runHook preInstall
            install -D $releaseDir/alacritty $out/bin/alacritty
          '' + (
            if stdenv.isDarwin then ''
              mkdir $out/Applications
              cp -r extra/osx/Alacritty.app $out/Applications
              ln -s $out/bin $out/Applications/Alacritty.app/Contents/MacOS
            '' else ''
              install -D extra/linux/Alacritty.desktop -t $out/share/applications/
              install -D extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg
              # patchelf generates an ELF that binutils' "strip" doesn't like:
              #    strip: not enough room for program headers, try linking with -N
              # As a workaround, strip manually before running patchelf.
              strip -S $out/bin/alacritty
              patchelf --set-rpath "${rPath}" $out/bin/alacritty
            ''
          ) + ''
            installShellCompletion --zsh extra/completions/_alacritty
            installShellCompletion --bash extra/completions/alacritty.bash
            installShellCompletion --fish extra/completions/alacritty.fish
            install -dm 755 "$out/share/man/man1"
            gzip -c extra/alacritty.man > "$out/share/man/man1/alacritty.1.gz"
            install -Dm 644 alacritty.yml $out/share/doc/alacritty.yml
            install -dm 755 "$terminfo/share/terminfo/a/"
            tic -xe alacritty,alacritty-direct -o "$terminfo/share/terminfo" extra/alacritty.info
            mkdir -p $out/nix-support
            echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
            runHook postInstall
          '';

          dontPatchELF = true;

          meta = with lib; {
            description = "A cross-platform, GPU-accelerated terminal emulator";
            homepage = "https://github.com/alacritty/alacritty";
            license = licenses.asl20;
            maintainers = with maintainers; [ filalex77 mic92 cole-h ma27 ];
            platforms = platforms.unix;
          };
        }
  ) {};

in
{
  programs.alacritty = {
    enable = true;
    package = alacritty-ligature;
    settings = {
      background_opacity = 1;
      bell = {
        animation = "EaseOutExpo";
        duration = 5;
        color = "#ffffff";
      };
      colors = {
        primary = {
          background = "#040404";
          foreground = "#c5c8c6";
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
          size = 11;
          ligature = true;
        };
        size = 11;
        ligature = true;
      };
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.tmux}/bin/tmux";
      window = {
        decorations = "full";
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
