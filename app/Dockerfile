FROM python:3.7.3-stretch

LABEL author="long161711@gmail.com"

# Working Directory
WORKDIR /app

# Copy source code to working directory to build
COPY . /app/

# Install all packages from version in  requirements.txt
# hadolint ignore=DL3013
RUN pip install  --no-cache-dir --upgrade pip && \
    pip install  --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app at container launch
CMD ["python", "app.py"]