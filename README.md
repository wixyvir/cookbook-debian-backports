debian-backports Cookbook
=========================

Attributes
----------

Attributes defined in `node['backports']` 

| Key                      | Type       | Default                          | Description                    |
| :----------------------- |:---------- | :------------------------------- | :----------------------------- |
| `mirror`                 | String     | `http://ftp.debian.org/debian`   | Backports mirror to use        |
| `components`             | String     | `['main']`                       | Backports components to use    |
| `install`                | String     | `[]`                             | Packages to install from bpo   |


## Usage

# Install backports

Just include `debian-backports` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[debian-backports]"
  ]
}
```

# Update kernel to last backports release

Just include `debian-backports::kernel` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[debian-backports::kernel]"
  ]
}
```

# Install packages from backports

Just include `debian-backports::package` in your node's `run_list` and set attributes accordingly:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[debian-backports::package]"
  ]
}
```


# Tests

run `kitchen test`

