FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies untuk fonts
RUN apt-get update && apt-get install -y \
    fonts-dejavu \
    fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements dan install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file project
COPY . .

# Run bot
CMD ["python", "telegram_bot.py"]
