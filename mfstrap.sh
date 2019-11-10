#! /bin/bash

BASE_STEAMAPPS_DIR="/Depot/Games"
while [ ! -z "$1" ]; do
    case "$1" in
        --steamapps|-s)
            shift;
            BASE_STEAMAPPS_DIR=$1;
            ;;
        *)
            ;;
    esac
    shift;
done

echo "MediaFoundation Quick Tool"
echo "==================="
echo "Using ${BASE_STEAMAPPS_DIR} as the directory containing SteamApps"
echo "If that's not the right one, use --steamapps or -s to tell the script which one to use."
echo "==================="
echo "There's gameids hardcoded in this script. Edit to change."
echo "==================="

for GAMEID in '294810' '263300' '388750' '586140'; do
  PFX="/Depot/Games/steamapps/compatdata/$GAMEID/pfx";
  if [ -d "$PFX" ]; then
    echo "Processing GameID ${GAMEID}"
    if [ ! -f "${PFX}/.mf_is_done" ]; then
      WINEPREFIX=$PFX ./install-mf.sh;
      touch ${PFX}/.mf_is_done;
      echo "MediaFoundation pass done!";
    else
      echo "MediaFoundation pass already done!";
    fi
    echo "-------------------"
  fi
done
