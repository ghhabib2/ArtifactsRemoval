# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./src /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Ensure necessary dependencies for Apple Silicon processors are included
# For example, torch and torchvision with support for Apple Silicon
RUN pip install torch torchvision torchaudio

# Specify the command to run the application
CMD ["python", "main.py"]