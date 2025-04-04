#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"/../../..

echo --- Creating sbf-sdk tarball

rm -rf sbf-sdk.tar.bz2 sbf-sdk/
mkdir sbf-sdk/
cp LICENSE sbf-sdk/

(
  ci/crate-version.sh platform-tools-sdk/cargo-build-sbf/Cargo.toml
  git rev-parse HEAD
) > sbf-sdk/version.txt

cp -a platform-tools-sdk/sbf/* sbf-sdk/

tar jvcf sbf-sdk.tar.bz2 sbf-sdk/
