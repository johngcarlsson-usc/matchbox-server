{ pkgs }: {
    deps = [
      pkgs.cargo
      pkgs.rustc
      pkgs.pkg-config
      pkgs.openssl
      pkgs.openssl.dev
    ];
    env = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
  }
  