{ stdenv, gmp, bison, lib, flex }:

stdenv.mkDerivation rec {
  pname = "ratio";
  version = "0.1";

  src = ./.;

  makeFlags = "PREFIX=$(out)";

  nativeBuildInputs = [ bison flex ];
  buildInputs = [ gmp ];

  meta = with lib; {
    description = "ratio calculator";
    homepage = "http://git.jb55.com/ratio";
    maintainers = with maintainers; [ jb55 ];
    license = licenses.gpl3Only;
  };
}
