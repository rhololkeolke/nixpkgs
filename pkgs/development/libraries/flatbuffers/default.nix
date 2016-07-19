{stdenv, cmake, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "flatbuffers-${version}";

  version = "1.3.0";

    src = fetchFromGitHub {
      owner = "google";
      repo = "flatbuffers";
      rev = "v${version}";
      sha256 = "0lsjnbxjvjl19hm8kznhsga8nbkwwxhrl5cmnpqxj48am6lckis0";
    };

    buildInputs = [ cmake ];


    cmakeFlags = [ "-DFLATBUFFERS_BUILD_TESTS=ON" ];

    enableParallelBuilding = true;

    doCheck = true;
    checkTarget = "test";

    meta = {
      description = "Google's FlatBuffers interchange format";
      longDescription = ''An alternative to Protobuf. Efficient in memory serialization.'';
      license = stdenv.lib.licenses.asl20;
      platforms = stdenv.lib.platforms.unix;
      homepage = "https://google.github.io/flatbuffers/";
    };

    passthru.version = version;
}
