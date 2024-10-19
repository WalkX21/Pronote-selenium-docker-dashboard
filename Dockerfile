# Step 1: Use the official Selenium standalone Chrome image
FROM selenium/standalone-chrome:latest

# Step 2: Install necessary utilities including Python and pip
USER root
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

# Step 3: Set up the working directory
WORKDIR /app

# Step 4: Copy your Python requirements and script
COPY requirements.txt /app/requirements.txt
COPY your_script.py /app/your_script.py

# Step 5: Install Python dependencies (e.g., Selenium)
RUN pip3 install --no-cache-dir -r /app/requirements.txt

# Step 6: Run your Selenium script
CMD ["python3", "/app/your_script.py"]

