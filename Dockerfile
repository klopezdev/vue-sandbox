FROM klopezinfor/npm-server

RUN ["npm", "install", "-g", "@vue/cli", "@vue/cli-service-global"]
RUN ["vue", "--version"]

# For live development, mount a volume to your workspace with -v (See # Development)
COPY ./ .

CMD ["npm", "run", "serve"]

# Build:                docker build --rm -t klopezinfor/vue-sandbox .
# Create a Vue Project: docker run --rm -it -v `pwd`:/webapp/ klopezinfor/vue-sandbox vue create .
# Note to build again if you want to run the newly created project from the image instead of a development environment
# Run Image:            docker run --rm -p 8080:8080 -p 8000:8000 klopezinfor/vue-sandbox
# Development:          docker run --rm -v `pwd`:/webapp/ -p 8080:8080 -p 8000:8000 klopezinfor/vue-sandbox

# vue ui --headless --port 8000 --host 0.0.0.0
