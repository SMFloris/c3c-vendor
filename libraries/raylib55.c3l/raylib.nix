{ raylib, fetchFromGitHub }:

raylib.overrideAttrs (_: {
  version = "5.5";

  src = fetchFromGitHub {
    owner = "raysan5";
    repo = "raylib";
    rev = "5.5";
    sha256 = "1dhy9ghbwvz0s434j03rfa2l6wxcfj028vlkk1xbf5q97vin5pr7";
  };
})
