#Labukas
{ config, pkgs, lib, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = [
      "gighmmpiobklfepjocnamgkkbiglidom" # Adblock
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "gcbommkclmclpchllfjekcdonpmejbdp" # HTTPS Everywhere
      "fngmhnnpilhplaeedifhccceomclgfbg" # EditThisCookie
      "fploionmjgeclbkemipmkogoaohcdbig" # Page load time
      "oldceeleldhonbafppcapldpdifcinji" # LT Grammar
      "mbniclmhobmnbdlbpiphghaielnnpgdp" # Lightshot screenshot // fix
      "gebbhagfogifgggkldgodflihgfeippi" # Youtube dislike
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for Youtube
      "mdjildafknihdffpkfmmpnpoiajfjnjd" # Consent-O-Matic (Cookies)
      "ghmbeldphafepmbegfdlkpapadhbakde" # Proton Pass
      "eifepbfdgonblafppielmnnihcopdlpo" # Mixpanel Tools
      "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
      "mpdajninpobndbfcldcmbpnnbhibjmch" # SAML tracer
      "cofdbpoegempjloogbagkncekinflcnj" # DeepL
    ];
    commandLineArgs = [
      "--force-dark-mode"
      "--ignore-gpu-blocklist"
    ];
    # package = pkgs.ungoogled-chromium;
  };
}
