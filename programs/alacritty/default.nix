{ pkgs, ... }:

let
  frameworks = pkgs.darwin.apple_sdk.frameworks;
  alacritty-ligature = pkgs.callPackage
    (

      { stdenv
      , lib
      , fetchFromGitHub
      , rustPlatform

      , cmake
      , gzip
      , installShellFiles
      , makeWrapper
      , ncurses
      , pkg-config
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
      , xdg-utils

        # Darwin Frameworks

      }:
      let
        rpathLibs = [
          stdenv.cc.cc.lib
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
        version = "0.7.2";

        src = fetchFromGitHub {
          owner = "zenixls2";
          repo = pname;
          rev = "3ed043046fc74f288d4c8fa7e4463dc201213500";
          sha256 = "1q5jnhmjxbbx7mq8jzkzkq48kczf52bbg4p2hq82acbkwkha9lfm";
        };


        cargoSha256 = "16jqiympfz24bqjaqyyfxgvva1jqzx6rrb6f1ms2gaarv1v47kir";

        nativeBuildInputs = [
          cmake
          gzip
          installShellFiles
          makeWrapper
          ncurses
          pkg-config
          python3
        ];

        buildInputs = rpathLibs
          ++ lib.optionals stdenv.isDarwin [
          frameworks.AppKit
          frameworks.CoreGraphics
          frameworks.CoreServices
          frameworks.CoreText
          frameworks.Foundation
          frameworks.OpenGL
        ];

        outputs = [ "out" "terminfo" ];

        postPatch = ''
          substituteInPlace alacritty/src/config/mouse.rs \
            --replace xdg-open ${xdg-utils}/bin/xdg-open
        '';

        postInstall = (
          if stdenv.isDarwin then ''
            mkdir $out/Applications
            cp -r extra/osx/Alacritty.app $out/Applications
            ln -s $out/bin $out/Applications/Alacritty.app/Contents/MacOS
          '' else ''
            install -D extra/linux/Alacritty.desktop -t $out/share/applications/
            install -D extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg
            # patchelf generates an ELF that binutils' " strip " doesn't like:
            #    strip: not enough room for program headers, try linking with -N
            # As a workaround, strip manually before running patchelf.
            strip -S $out/bin/alacritty
            patchelf --set-rpath "${lib.makeLibraryPath rpathLibs}" $out/bin/alacritty
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

        '';

        dontPatchELF = true;

        meta = with lib; {
          description = "A cross-platform, GPU-accelerated terminal emulator";
          homepage = "https://github.com/alacritty/alacritty";
          license = licenses.asl20;
          maintainers = with maintainers; [ Br1ght0ne mic92 cole-h ma27 ];
          platforms = platforms.unix;
        };

      }

    )
    { };

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
          style = "Light";
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
