FROM node:18
WORKDIR /app
RUN npm install -g @google/gemini-cli
RUN echo 'gemini' >> /root/.bashrc
CMD ["tail", "-f", "/dev/null"]