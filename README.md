# An ACA Sample App For Connecting to Redis

This app is used by the Azure Container Apps "Connecting To Services"
tutorial. It's a very basic webapp that allows the user to add (or remove)
strings from a DB. When the appropriate environment variables are set it'll
store the strings in a Redis Cache, or if they're not set then it'll just
keep the strings in memory.

When the app scales down to zero the in-memory storage will be lost, but
when it's using Redis then when the app scales back up it'll remember all
previous strings.

This app is meant to be used to showcase the ability to "bind" ACA apps
to development and managed services.

You can bind using the `--bind` argument, for example:

```
$ az containerapp create -n myapp --bind myredis
```

and unbind in a similar way:

```
$ az containerapp update -n myapp --unbind myredis
```

where `myredis` is the name of the Redis service - either a development service
or an Azure managed service.

You can create a development service like this:

```
$ az containerapp service redis create -n myredis
```

To create an Aure managed Redis service see the normal Redis docs.

For more information on the tutorial see:
[here]().
