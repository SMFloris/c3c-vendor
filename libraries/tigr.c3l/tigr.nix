{ stdenv, fetchFromGitHub, libGL, libGLU, libX11 }:

stdenv.mkDerivation {
  pname = "tigr";
  version = "0-unstable-2026-06-13";

  src = fetchFromGitHub {
    owner = "erkkah";
    repo = "tigr";
    rev = "f7bf2abbf6b26e649ced5691003e87b61c03762e";
    sha256 = "0r49rabnvswzsspdz8zsyqv5p5yhf3mv4cbxy807rs8dnh382bw2";
  };

  strictDeps = true;
  dontConfigure = true;
  propagatedBuildInputs = [ libGL libGLU libX11 ];

  buildPhase = ''
    runHook preBuild
    $CC -O2 -fPIC -c tigr.c -o tigr.o
    $AR rcs libtigr.a tigr.o
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -Dm644 libtigr.a $out/lib/libtigr.a
    install -Dm644 tigr.h $out/include/tigr.h
    runHook postInstall
  '';
}
