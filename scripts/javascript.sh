#!/usr/bin/env bash

. bash-utils.sh

start "javascript"

log "install nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

log "install node..."
run nvm i 22

log "install bun..."
run curl -fsSL https://bun.sh/install | bash

log "install deno..."
run curl -fsSL https://deno.land/install.sh | sh

finish
