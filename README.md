# jacoelho.phoenix-app

Deploy elixir phoenix applications using ansible

This role doesn't install elixir or nodejs, you should do it before using this role. Recommendations:
```yaml
    - role: nodesource.node
    - role: jacoelho.elixir
```

### Configuration

Available options:

```yaml
phoenix_app_name: app
phoenix_app_user: app
phoenix_app_group: app
phoenix_app_path: /var/www
phoenix_app_port: 4000
phoenix_app_mix_env: prod
phoenix_app_repository: "git://<url>/<repository>"
phoenix_app_version: master
phoenix_app_run_brunch: true
phoenix_app_run_migrate: true
phoenix_app_env: {}
phoenix_app_configs: []
```

Non obvious ones:

```phoenix_app_run_brunch```: install brunch and run brunch install

```phoenix_app_run_migrate```: run ecto.migrate

```phoenix_app_env```: environment variables to load, example:

```yaml
phoenix_app_env:
    HUBOT_URL: "https://hubot"
    FOO: "bar"
```

```phoenix_app_configs```: create config files from variables, example:

```yaml
phoenix_app_configs:
    - file: "{{ phoenix_app_path }}/{{ phoenix_app_name }}/config/test.exs"
      content: |
        :config, :test, :test "something"
```

### Dependencies

This role need elixir installed and may need nodejs

Recommended roles:
* [nodesource.node](https://galaxy.ansible.com/list#/roles/1488)
* [jacoelho.elixir](https://galaxy.ansible.com/list#/roles/4145)

### Author Information

José Coelho

Thanks to [mtpereira](https://mtpereira.com) [role](https://github.com/mtpereira/ansible-nodejs-app/) for role structure
