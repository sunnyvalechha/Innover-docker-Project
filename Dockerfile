FROM nginx:latest
                    RUN apt-get update && apt-get install -y git && apt-get clean
                    WORKDIR /usr/share/nginx/html
                    RUN git clone ${REPO_URL} /tmp/repo \\
                        && cp /tmp/repo/${REPO_PATH} /usr/share/nginx/html/index.html \\
                        && rm -rf /tmp/repo
                    EXPOSE 80
                    CMD ["nginx", "-g", "daemon off;"]
