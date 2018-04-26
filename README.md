# Use VSCode for Windows to develop C/C++ apps for Linux
Write C/C++ source codes with Visual Studio Code on Windows. Compile and Debug them through the GNU C/C++ toolchain running in the Docker container.

## System requirement
Windows 10 Pro 64bit (1607 update) or later is required for the installation of Docker for Windows. More details see [Install Docker for Windows](https://docs.docker.com/docker-for-windows/install/#what-to-know-before-you-install).

Editors or IDEs are not restricted if just want to build. Visual Studio Code is recommanded because its debugger can intract with GBD in docker container after some scripting.

## Test the example
1. Install Docker for Windows.
2. In "Settings / Shared Drivers", share the driver of this project located to enable bind mount.
3. Run `docker-compose -f this/project/path/docker-compose.yml up` in PowerShell to build the docker image with g++ and others. This will take a long period to finish.
4. Run "Build with CMake" task to configure and compile. The executable `HelloWorld` will be generated under `this/project/path/project/build/`.
5. Run "Start debug container" task before debuging the example.
6. Add some breakpoints as you want. Launch debug session. Have fun!
7. Don't forget to close the debug container after finishing development.

## TODO
- Automatically start debug container before launching debug session.
- Stop debug container when VSCode exited.
