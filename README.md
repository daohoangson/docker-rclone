Lightweight rclone container (Alpine+Rclone)

# Examples

## --version

Running the container in interactive mode with TTY to use it. By default `rclone --version` will be executed.

`docker run -v "$PWD/config":/home/rclone -it --rm xfrocks/rclone`

Please note that for the first run, the container will start with `rclone config` to setup configuration file etc., it won't run further unless a config file is found.

## Other commands

Apply rclone command and arguments directly to execute it. For example:

`docker run -v "$PWD/config":/home/rclone -it --rm xfrocks/rclone lsd remote:path`
