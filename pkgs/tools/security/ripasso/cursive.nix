{ stdenv, lib, rustPlatform, fetchFromGitHub, pkgconfig, ncurses, python3, openssl, libgpgerror, gpgme, xorg }:

with rustPlatform;
buildRustPackage rec {

  version = "unstable-2019-08-24";
  pname = "ripasso-cursive";

  src = fetchFromGitHub {
    owner = "cortex";
    repo = "ripasso";
    sha256 = "1lzim92q26gg225bdpz5k1pk826438ghp3irp9j0x9p7k6qfwjn3";
    rev = "b64b1d9b697b2246b96db24a9d9ae571eab839aa";
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
