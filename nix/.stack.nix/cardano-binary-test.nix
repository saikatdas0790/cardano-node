{ system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  {
    flags = { development = false; };
    package = {
      specVersion = "1.10";
      identifier = { name = "cardano-binary-test"; version = "1.3.0"; };
      license = "MIT";
      copyright = "2019 IOHK";
      maintainer = "operations@iohk.io";
      author = "IOHK";
      homepage = "";
      url = "";
      synopsis = "Test helpers from cardano-binary exposed to other packages";
      description = "Test helpers from cardano-binary exposed to other packages";
      buildType = "Simple";
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs.base)
          (hsPkgs.bytestring)
          (hsPkgs.cardano-binary)
          (hsPkgs.cardano-prelude)
          (hsPkgs.cardano-prelude-test)
          (hsPkgs.cborg)
          (hsPkgs.containers)
          (hsPkgs.formatting)
          (hsPkgs.hedgehog)
          (hsPkgs.hspec)
          (hsPkgs.pretty-show)
          (hsPkgs.QuickCheck)
          (hsPkgs.quickcheck-instances)
          (hsPkgs.text)
          (hsPkgs.vector)
          ];
        };
      };
    } // {
    src = (pkgs.lib).mkDefault (pkgs.fetchgit {
      url = "https://github.com/input-output-hk/cardano-base";
      rev = "468d9b79ae3ac28f5f2cbb3ce52623a69923c4ef";
      sha256 = "13hcbgmcg3zzllii95r6qr9mkch6p4lf9ds04ar5jpnbc2az284q";
      });
    postUnpack = "sourceRoot+=/binary/test; echo source root reset to \$sourceRoot";
    }