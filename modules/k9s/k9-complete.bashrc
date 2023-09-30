#!/usr/bin/env bash
complete -W "$(ls ~/.kube/config.d)" k9
