{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "tinyfiledialogs";
  version = "0-unstable-2026-08-13";

  src = fetchFromGitHub {
    owner = "native-toolkit";
    repo = "libtinyfiledialogs";
    rev = "cc6b593c029110af8045826ce691f540c85e850c";
    sha256 = "1qmjjjxnhhs28f5p4j9p9m2n79g72wxbw4fd639rqgr3sqdh4pyh";
  };

  strictDeps = true;
  dontConfigure = true;

  buildPhase = ''
    runHook preBuild
    $CC -O2 -fPIC -c tinyfiledialogs.c -o tinyfiledialogs.o
    $AR rcs libtinyfiledialogs.a tinyfiledialogs.o
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm644 libtinyfiledialogs.a $out/lib/libtinyfiledialogs.a
    install -Dm644 tinyfiledialogs.h $out/include/tinyfiledialogs.h
    runHook postInstall
  '';
}
