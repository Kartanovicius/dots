{ default }:
let
  OSLogo = builtins.fetchurl rec {
    name = "OSLogo-${sha256}.png";
    sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
    url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
  };
in
''
  * {
    border: none;
    border-radius: 0;
    font-family: "JetBrains Mono", "Font Awesome 5 Free";
    font-size: 12px;
    font-style: normal;
    min-height: 0;
    background: rgba(31,31,40,.0);
    padding: 0 0.75rem;
  }
  window#waybar {
    background: rgba(31,31,40,.85);
    transition-property: background-color;
    transition-duration: .5s;
    color: ${default.xcolors.fg}
  }
  #tags {
    padding: 3px 0px;
    border: solid 0px ${default.xcolors.fg};
    font-weight: normal;
  }
  #tags button {
    margin: 0px 3px;
    padding: 0;
    color: ${default.xcolors.comment};
    background-color: ${default.xcolors.comment};
    border: solid 0px transparent;
    transition: all 0.3s ease-in-out;
    text-shadow: 0px 0px;
    box-shadow: inset 0 0 transparent;
    border-radius: 100px;
    font-size: 5px;
  }
  #tags button:hover {
    color: ${default.xcolors.disabled};
    background-color: ${default.xcolors.disabled};
    background-size: 100% 100%;
  }
  #tags button.occupied {
    color: ${default.xcolors.disabled};
    background-color: ${default.xcolors.disabled};
  }
  #tags button.focused {
    color: ${default.xcolors.primary};
    background-color: ${default.xcolors.primary};
    background-size: 100% 100%;
    transition: all 0.3s ease-in-out;
    background-image: url("${OSLogo}");
  }
  
''
