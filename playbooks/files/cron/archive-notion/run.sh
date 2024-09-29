cd /home/ansible-user/cron/archive-notion
docker compose up
docker stop archive-notion
docker rm -f archive-notion
