{ rustPlatform, fetchFromGitHub, stdenv, pkgconfig, openssl, libgit2, gettext, autoconf, automake }:

rustPlatform.buildRustPackage rec {
  name = "ripasso-${version}";
  version = "b64b1d9b697b2246b96db24a9d9ae571eab839aa";

  CARGO_MEMBERS = "cursive";

  src = fetchFromGitHub {
    owner = "cortex";
    repo = "ripasso";
    rev = "${version}";
    sha256 = "1z76rspb40cbcf6wglh7gcs9r1dqc5zhpfmpxlrvnihlf96rfraa";
  };

  nativeBuildInputs = [
    pkgconfig
  ];


  buildInputs = [
    openssl libgit2 gettext autoconf automake
  ];

  cargoSha256 = "0dwaa106vj7jbgshhqpjabsr0zmkg1a5syzky7jcaasvc7r7njwl";

  meta = with stdenv.lib; {
    description = "A password manager that uses the file format of the standard unix password manager 'pass', implemented in rust.";
    homepage = https://github.com/cortex/ripasso/;
    license = licenses.gpl3;
    maintainers = [ maintainers.capitol ];
    platforms = platforms.unix;
  };
}