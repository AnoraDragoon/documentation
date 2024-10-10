# Debugging a Spring Boot application running in a Docker container

Debugging a Spring Boot application running in a Docker container involves a few key steps:

1. **Modify `docker-compose.yml`** to Pass Environment Variables

   ```yaml
   version: "3.5"

   services:
     my-spring-boot-app:
       image: my-spring-boot-app
       # ...
       environment:
         # ...
         JAVA_DEBUG: "true"
         JAVA_TOOL_OPTIONS: -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8787
       ports:
         - 8787:8787
   ```

2. **Re-run the Docker container using Docker Compose**:

   ```sh
   docker-compose down
   ```

   ```sh
   docker-compose up -d
   ```

3. Connect a Debugger to the Running Container:

   Use an IDE like IntelliJ IDEA or VSCode to connect to the remote debugging port of your running container.

   - **In IntelliJ IDEA:**

     > Go to **Run** > **Edit Configurations**.
     > \
     > Click **+** and select **Remote**.
     > \
     > Set a descriptive name.
     > \
     > Set the host to `<environment_URL>` (horizon-app.tt085int.dev.sicpa.io) and the port to 8787.
     > \
     > Apply the configuration and start debugging.

   - **In Visual Studio Code:**

     First of all, it is required to have installed extension: [Debugger for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug)

     > Go to **Run** > **Add Configuration...** > **Java**
     > \
     > Add to `launch.json` file next configuration:
     > \
     > Save the configuration and start debugging.

     `launch.json`

     ```json
     {
       // Use IntelliSense to learn about possible attributes.
       // Hover to view descriptions of existing attributes.
       // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
       "version": "0.2.0",
       "configurations": [
         {
           "type": "java",
           "name": "InspectionINT",
           "request": "attach",
           "projectName": "tkho-horizon-inspection",
           "hostName": "horizon-app.tt085int.dev.sicpa.io",
           "port": 8787
         }
       ]
     }
     ```
