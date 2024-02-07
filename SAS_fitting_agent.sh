#!/bin/bash -i

git config --global credential.helper store

source activate afl

if [[ -z "${TILED_API_KEY}" ]]; then
  export TILED_API_KEY=$(cat ~/.afl/tiled_api_key)
else
  export TILED_API_KEY="${TILED_API_KEY}"
fi

if [[ -z "${AFL_SYSTEM_SERIAL}" ]]; then
  export AFL_SYSTEM_SERIAL=$(cat ~/.afl/system_serial)
else
  export AFL_SYSTEM_SERIAL="${AFL_SYSTEM_SERIAL}"
fi


cd ~/AFL-automation/
git pull

#replace after confirmation
#python ~/AFL-automation/server_scripts/virtual_instrument/VirtualSpec_data.py

python /Users/drs18/Documents/multimodal-dev/SAS_fitting_agent_dev/SAS_fitting_agent.py
