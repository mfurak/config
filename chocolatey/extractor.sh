#! /usr/bin/bash

choco list -lo | grep -E '[0-9]+' > packages.choco
