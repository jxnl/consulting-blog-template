# Use the official MkDocs Material image as a base
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcairo2-dev \
    libfreetype6-dev \
    libffi-dev \
    libjpeg-dev \
    libpng-dev \
    libz-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy your MkDocs project files
COPY requirements-doc.txt .
RUN pip install --no-cache-dir -r requirements-doc.txt

COPY build_mkdocs.sh .
RUN chmod +x build_mkdocs.sh

WORKDIR /docs

# Expose the default MkDocs development server port
EXPOSE 8000

# Start the MkDocs development server with live reload
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000", "--livereload"]