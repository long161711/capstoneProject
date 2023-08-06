# Dockerfile for Python 3.7.3 with Stretch base image

# Set the author's email address
LABEL author="long161711@gmail.com"

# Set the working directory inside the container
WORKDIR /app

# Copy the source code to the working directory
COPY . /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Expose port 80 to allow incoming connections
EXPOSE 80

# Command to run the app when the container is launched
CMD ["python", "app.py"]
