{ stdenv, gmp, bison, flex }:

stdenv.mkDerivation rec {
  name = "ratio-${version}";
  version = "0.1";

  src = ./.;

  makeFlags = "PREFIX=$(out)";

  nativeBuildInputs = [ bison flex ];
  buildInputs = [ gmp ];

  meta = with stdenv.lib; {
    description = "ratio calculator";
    homepage = "https://github.com/jb55/ratio";
    maintainers = with maintainers; [ jb55 ];
    license = licenses.gpl3Only;
  };
}
