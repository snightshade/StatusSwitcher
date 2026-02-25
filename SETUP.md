# Setup in Docker (recommended)
- Pull down the container image at `ghcr.io/snightshade/statusswitcher:latest`.
- Set up a bind mount with your JSON config, at `/app/config.json`.
  - For example: `docker run -b ./my-config.json:/app/config.json:ro ghcr.io/snightshade/statusswitcher:latest`
  - (Obviously, if you're hosting this in production you'd use Docker Compose or something)
  - We recommend mounting the config read-only, though the app has no way to writeback to it anyway
- Run the image with that bind mount in place, everything else should just work from there

# Setup by manually building the binary
- Ensure you have the .NET 8.0 app SDK installed
  - You can build it with newer versions of .NET too, but it won't run unless you have the 8.0 runtime.
- Compile the application
  - A simple `dotnet publish` is going to work.
- Set the `CONFIG_PATH` environment variable to the path to your JSON file
- Run the binary, probably with systemd
