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
  run sudo su - app -c 'mix hex.info'
  [ "$status" -eq 0 ]
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
  grep "MIX_ENV=\".*\"" /etc/default/app
}

@test "Check that app env was port defined" {
  grep "PORT=\".*\"" /etc/default/app
}

@test "Check that app is running" {
  run bash -c "netstat -an |grep -o 0.0.0.0:4000"
  [ "$status" -eq 0 ]
  [ "$output" = "0.0.0.0:4000" ]
}

@test "Check that config file was created" {
  test -f "/var/www/app/config/test.exs"
}

@test "Check that config file has content" {
  grep "use Mix.Config" /var/www/app/config/test.exs
}
