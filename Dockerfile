FROM rancher/ui:build

EXPOSE 8000

WORKDIR /source
COPY package.json ./
COPY scripts ./scripts
RUN yarn config set registry 'https://registry.npm.taobao.org' ; npm config set registry https://registry.npm.taobao.org ; yarn install && yarn cache clean
COPY . /source
ENTRYPOINT ["yarn"]
CMD ["start","--ssl=false"]
