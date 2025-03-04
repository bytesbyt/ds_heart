# Specify the Python type
FROM python:3.8-slim

# Install system dependencies for h5py and other packages
RUN apt-get update && apt-get install -y \
    pkg-config \
    libhdf5-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Specify the working directory of the host
WORKDIR /ds_heart

# Copy eveything in our current directory into the heart inside our docker container
# The period indicate the host working directory
COPY . /ds_heart

# Running the requirement file
RUN pip install -r requirements.txt

# Set a port (stremalit default port is 8501)
EXPOSE 8501

# Users don't need to run program manually
# Starts the application automatically
CMD ["streamlit", "run", "heart_model.py"]



## building an image
# docker build -t heart_pred .


# docker images
# docker run -p 8501:8501 heart_pred
# docker login
# docker tag heart_pred tes00/heart_pred:latest
# docker push tes00/heart_pred:latest
