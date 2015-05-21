debian-backports Cookbook
=========================
Just include `debian-backports` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[debian-backports]"
  ]
}
```

