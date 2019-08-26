{ stdenv, lib, rustPlatform, fetchFromGitHub, pkgconfig, ncurses, python3, openssl, libgpgerror, gpgme, xorg }:

with rustPlatform;
buildRustPackage rec {

  version = "unstable-2019-08-24";
  pname = "ripasso-cursive";

  src = fetchFromGitHub {
    owner = "cortex";
    repo = "ripasso";
    sha256 = "1z9kpq1ld0dv3m19z77cz1xivfj53sjgd1z8d7nqbrja2bdkncrm";
    rev = "4aad4de8b0a46f2c65e9912f9f267da55068f6c3";
  };

  cargoSha256 = "0dwaa106vj7jbgshhqpjabsr0zmkg1a5syzky7jcaasvc7r7njwl";
  cargoBuildFlags = [ "-p ripasso-cursive" ];

  nativeBuildInputs = [ pkgconfig ];
  buildInputs = [
    ncurses python3 openssl libgpgerror gpgme xorg.libxcb
  ];
  meta = with stdenv.lib; {
    description = "A simple password manager written in Rust";
    homepage = "https://github.com/cortex/ripasso";
    license = licenses.gpl3;
    maintainers = with maintainers; [ sgo ];
    platforms = platforms.linux;
  };
}
