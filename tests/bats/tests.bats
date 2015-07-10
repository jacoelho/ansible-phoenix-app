#!/usr/bin/env bats

@test "Check that the app user was created" {
  grep "app" /etc/passwd
}

@test "Check that app group was created" {
  grep "app" /etc/group
}

@test "Check that app home was created" {
  test -d "/var/www"
}

@test "Check that brunch was installed" {
  npm list -g --depth=0 | grep brunch
}

@test "Check that hex was installed" {
  mix hex.info
}

@test "Check that git was installed" {
  command -v git
}

@test "Check that app upstart script was created" {
  test -f "/etc/init/app.conf"
}

@test "Check that app env was created" {
  test -f "/etc/default/app"
}

@test "Check that app env was mix_env defined" {
  grep "export MIX_ENV=\".*\"" /etc/default/app
}

@test "Check that app env was port defined" {
  grep "export PORT=\".*\"" /etc/default/app
}
