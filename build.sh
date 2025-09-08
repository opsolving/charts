#!/bin/bash

set -euo pipefail

rm -rf docs
mkdir -p docs

for chart in opsolving/*/; do
  helm dependency update "$chart" || true
  helm package "$chart" -d docs
done

helm repo index docs --url https://opsolving.github.io/charts

git add .