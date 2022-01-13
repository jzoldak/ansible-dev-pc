#!/usr/bin/env bash
podman-acr-login() {
    local -r username='00000000-0000-0000-0000-000000000000'


    acr_password() {
        local -r registry="${1}"

        set +x
        az acr login \
            --name "${registry}" \
            --expose-token  \
            2>/dev/null \
            | jq -r '.accessToken'
    }


    podman_login() {
        local -r registries=("${@}")

        for registry in "${registries[@]}"; do
            printf "%s: %s\n" "${registry}" "$(
                acr_password "${registry}" \
                    | podman login \
                        --username "${username}" \
                        --password-stdin \
                        "${registry}.azurecr.io"
            )"
        done
    }


    podman_login "${@}"
    unset -f acr_password podman_login
}
