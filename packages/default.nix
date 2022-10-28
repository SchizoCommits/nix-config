inputs:

let
  system = "x86_64-linux";
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in

{
  rofi-mpd = pkgs.callPackage "${inputs.self}/packages/rofi-mpd" { };
  neovim = inputs.self.nixosConfigurations.pongo.config.home-manager.users.kranzes.programs.neovim.finalPackage.override { wrapRc = true; };
}
