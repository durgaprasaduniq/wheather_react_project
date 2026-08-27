FROM amazonlinux

RUN yum update -y

# Install required packages
RUN yum install -y git nginx nodejs npm

WORKDIR /app

# Clone React project
RUN git clone https://github.com/durgaprasaduniq/wheather_react_project.git

WORKDIR /app/wheather_react_project

# Install dependencies
RUN npm install

# Build React application
RUN npm run build

# Remove default Nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy React build files
RUN cp -r build/* /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
