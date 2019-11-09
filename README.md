# Vue Sandbox

This repository includes a Dockerfile for rapid adoption/development. Note that there is a dependent Docker images which is available at https://github.com/klopezdev/npm-server.

If you wish to start from "scratch", you should check out the project at commit 81ae855 "Initial Dockerfile for Vue CLI". From there, you can follow the documentation below to create a new project of your own. 

For live development, mount a volume to your workspace with -v (See Local Live Development)


## Local Live Development
```
docker run --rm -v `pwd`:/webapp/ -p 8080:8080 -p 8000:8000 klopezinfor/vue-sandbox
```
If you have not already installed Docker do so at https://www.docker.com/get-started.

This is the main command for this project. After running this command from within this project's directory, this Vue project will be running and available on localhost at 8080. You can change the port by changing the left hand value of the -p parameter.

The server will be responsive to changes in your local directory meaning you have live development support out of the box.

Note that this command leverages `pwd` to mount a volume in the current directory. You can change this to any directory to work on its contents in this container. Docker requires that you specify an absolute path.

### Vue UI

If you want to run Vue ui from within the container, run the following command within the continer after exec in. You can start with the live development command above which already includes a port mapping for 8000.
```
vue ui --headless --port 8000 --host 0.0.0.0
```

## Docker Build
```
docker build --rm -t klopezinfor/vue-sandbox .
```
Any changes you make to this project can be rebuilt into an image as shown in this command. You can change the -t value to an image name of your liking. All other commands will then need to reference that value so that they work against your image.

# Run Image
Important: Remember to rebuild this image to include any new changes you have made.
```
docker run --rm -p 8080:8080 klopezinfor/vue-sandbox
```

# Create New Vue Project
```
docker run --rm -it -v `pwd`:/webapp/ klopezinfor/vue-sandbox vue create .
```
This command will create a new Vue project at the current directory. If you are starting from "scratch" then this will initialize the initial project. 

Note that you can change the "." directory to any directory name to have Vue CLI create a project in a new subdirectory. 

Also note that this command leverages `pwd` to mount a volume in the current directory. You can change this to any directory to create a new Vue project in that directory on your local machine. Docker requires that you specify an absolute path.




# Vue CLI Project Details Follow

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
