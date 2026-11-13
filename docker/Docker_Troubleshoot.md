

#### DISK SPACE GETTING FULL FROM BELOW DATA DIRECTORY:
`io.containerd.content.v1.content/blobs/sha256`
The io.containerd.content.v1.content/blobs/sha256 directory grows large because containerd stores immutable compressed layer blobs and uncompressed content objects here. Prune unused data using container runtime tools or adjust garbage collection settings to safely reclaim disk space.

To safely clean up the containerd/daemon/io.containerd.content.v1.content/blobs/sha256 directory in a Docker and Docker Compose environment, run a deep system prune and clean up local build caches. Docker manages these containerd blobs internally, so you should never delete files from this directory manually, as it will corrupt your container runtime.

docker system df

docker builder prune -a --force

docker image prune -a --force


Automating Prevention in Docker ComposeYou can prevent future bloat by telling Docker to automatically discard build caches and clean up after container life cycles.Auto-clean on exit: Use the --rm flag when running temporary containers (e.g., docker compose run --rm service_name).Limit log sizes: Add log limits to your docker-compose.yml file to stop container logs from expanding indefinitely:yaml
```
logging:
  driver: "json-file"
  options:
    max-size: "10m"
    max-file: "3"
```