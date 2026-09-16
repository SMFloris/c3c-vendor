{ stdenv, raygui, raylib }:

stdenv.mkDerivation {
  pname = "raygui-static";
  inherit (raygui) version;

  dontUnpack = true;
  strictDeps = true;
  propagatedBuildInputs = [ raylib ];

  buildPhase = ''
    runHook preBuild
    printf '%s\n' '#define RAYGUI_IMPLEMENTATION' '#include <raygui.h>' > raygui.c
    $CC -O2 -fPIC -I${raygui}/include -I${raylib}/include -c raygui.c -o raygui.o
    $AR rcs libraygui.a raygui.o
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm644 libraygui.a $out/lib/libraygui.a
    install -Dm644 ${raygui}/include/raygui.h $out/include/raygui.h
    runHook postInstall
  '';
}
