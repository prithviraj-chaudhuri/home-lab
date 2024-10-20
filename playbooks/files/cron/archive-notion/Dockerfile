FROM python:3.10

WORKDIR /opt/scripts/
COPY secrets/.env config/.env

RUN wget https://raw.githubusercontent.com/prithviraj-chaudhuri/shortcut-scripts/refs/heads/main/requirements.txt -O requirements.txt
RUN pip install -r /opt/scripts/requirements.txt
RUN wget https://raw.githubusercontent.com/prithviraj-chaudhuri/shortcut-scripts/refs/heads/main/archive-notion-tasks/download-clear-archive-notion.py -O archive-notion-tasks/download-clear-archive-notion.py
WORKDIR /opt/scripts/archive-notion-tasks

CMD ["python", "download-clear-archive-notion.py"]
