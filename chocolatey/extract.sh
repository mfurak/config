#! /usr/bin/bash

choco list -lo | grep -E '^[^A-Z].*[0-9]+\.[0-9]+.*' > packages.choco
