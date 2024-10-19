# Step 1: Use the official Selenium standalone Chrome image
FROM selenium/standalone-chrome:latest

# Step 2: Install necessary utilities including Python, pip, and venv
USER root
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv

# Step 3: Set up the working directory
WORKDIR /app

# Step 4: Copy your Python requirements and script
COPY requirements.txt /app/requirements.txt
COPY your_script.py /app/your_script.py

# Step 5: Create a virtual environment and install Python dependencies
RUN python3 -m venv /app/venv
RUN /app/venv/bin/pip install --upgrade pip
RUN /app/venv/bin/pip install --no-cache-dir -r /app/requirements.txt

# Step 6: Run your Selenium script within the virtual environment
CMD ["/app/venv/bin/python", "/app/your_script.py"]
