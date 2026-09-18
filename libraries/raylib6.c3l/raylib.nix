{
  raylib,
  fetchFromGitHub,
  lib,
  stdenv,
  libXrandr,
  libXinerama,
  libXi,
  libXcursor,
}:

raylib.overrideAttrs (oldAttrs: {
  version = "6.0";

  src = fetchFromGitHub {
    owner = "raysan5";
    repo = "raylib";
    rev = "6.0";
    sha256 = "1scwmldxk5bvr4k99vi5cy4kjm77x5603pc9qxi2mv8w6c6qrvpk";
  };

  buildInputs = oldAttrs.buildInputs ++ lib.optionals stdenv.hostPlatform.isLinux [
    libXrandr
    libXinerama
    libXi
    libXcursor
  ];
})
