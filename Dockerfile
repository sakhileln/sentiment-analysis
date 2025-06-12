FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy project files into the container
COPY . /app/

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# app/main.py is entry point:
CMD ["python", "app/main.py"]

