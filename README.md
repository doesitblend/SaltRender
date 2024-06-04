# SaltRender
A simple container with a Salt minion with `salt-call` set as the entrypoint.
The intention is for this to be used as a local build step container in order
to dynamically render local files in other repos.

Example: Use something like the following command to dynamically generate a 
docker compose.yml file.

```
$ docker run --rm --name=rendermachine -v ${PWD}/config:/srv/salt state.apply setup_compose
```
The command would execute the state file from the local file system via the 
bind mount and, assuming the state dumps the files back to the already mounted
file system, create/setup the files for the local repo.

