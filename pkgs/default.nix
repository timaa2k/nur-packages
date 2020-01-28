{ pkgs }:

{

} // (if pkgs.stdenv.isDarwin then {
  yabai = pkgs.callPackage ./os-specific/darwin/yabai {
    inherit (pkgs) stdenv fetchFromGitHub;
    inherit (pkgs.darwin.apple_sdk.frameworks) Carbon Cocoa ScriptingBridge;
  };
} else {
  
})
