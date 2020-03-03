{ stdenv, fetchFromGitHub, Carbon, Cocoa, ScriptingBridge }:

stdenv.mkDerivation rec {
  name = "yabai-${version}";
  version = "2.2.2";
  src = fetchFromGitHub {
    owner = "koekeishiya";
    repo = "yabai";
    rev = "v${version}";
    sha256 = "0379ppvzvz0hf0carbmyp4rsbd8lipc1g2dwk5324q7iypfv3yrp";
  };

  installPhase = ''
    mkdir -p $out/bin
    make install
    cp bin/* $out/bin/
    mkdir -p $out/share/man/man1
    cp doc/yabai.1 $out/share/man/man1/yabai.1
  '';

  buildInputs = [ Carbon Cocoa ScriptingBridge ];

  meta = with stdenv.lib; {
    description = "Tiling window manager for macOS based on plugin architecture";
    homepage = https://github.com/koekeishiya/yabai;
    platforms = platforms.darwin;
    license = licenses.mit;
  };
}
