{ lib, fetchurl, buildLinux, ... } @ args:

with lib;

buildLinux (args // rec {
  version = "6.5";

  # modDirVersion needs to be x.y.z, will automatically add .0 if needed
  modDirVersion = versions.pad 3 version;

  # branchVersion needs to be x.y
  extraMeta.branch = versions.majorMinor version;

  src = fetchurl {
    url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
    hash = "sha256-eldLvCCALqdrUsp/rwcmf3IEXoYbGJFcUnKpjCer+IQ=";
  };
} // (args.argsOverride or { }))
