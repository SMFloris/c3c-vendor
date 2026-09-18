{ raylib, fetchFromGitHub }:

raylib.overrideAttrs (oldAttrs: {
  version = "5.0";

  src = fetchFromGitHub {
    owner = "raysan5";
    repo = "raylib";
    rev = "5.0";
    sha256 = "0327licmylwlh5iyzw35pq7ci2d15rp3jms5i9p0vfg1rlv2sjw0";
  };

  cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DCMAKE_POLICY_VERSION_MINIMUM=3.5" ];
})
