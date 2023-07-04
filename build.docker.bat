REM To see commands output from docker on Windows
set BUILDKIT_PROGRESS=plain
set DOCKER_BUILDKIT=0
call docker build -t ghcr.io/eyevi-technologies/las-tools:latest .