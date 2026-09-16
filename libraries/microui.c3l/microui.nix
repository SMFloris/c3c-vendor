{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "microui";
  version = "0-unstable-2024-03-23";

  src = fetchFromGitHub {
    owner = "rxi";
    repo = "microui";
    rev = "0850aba860959c3e75fb3e97120ca92957f9d057";
    sha256 = "1bkz41zgy86rwiq3vvlbmrg6cwf2wyvxfh53pxk9wr2fvv7lsad2";
  };

  strictDeps = true;
  dontConfigure = true;

  buildPhase = ''
    runHook preBuild
    $CC -O2 -fPIC -c src/microui.c -o microui.o
    $AR rcs libmicroui.a microui.o
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm644 libmicroui.a $out/lib/libmicroui.a
    install -Dm644 src/microui.h $out/include/microui.h
    runHook postInstall
  '';
}
