{
  description = "This environment provides the Catppuccinifier";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    catppuccinifier = {
      url = "github:lighttigerXIV/catppuccinifier";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    catppuccinifier,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        catppuccinifier.packages.${pkgs.system}.cli
      ];
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://isabelroses.cachix.org"
    ];
    extra-trusted-public-keys = [
      "isabelroses.cachix.org-1:mXdV/CMcPDaiTmkQ7/4+MzChpOe6Cb97njKmBQQmLPM="
    ];
  };
}
