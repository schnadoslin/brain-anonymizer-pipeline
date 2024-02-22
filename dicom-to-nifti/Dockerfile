# Use an ubuntu image as the base image
FROM ubuntu:24.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl unzip parallel

RUN curl -fLO https://github.com/rordenlab/dcm2niix/releases/download/v1.0.20230411/dcm2niix_lnx.zip
 #--output dcm2niix.zip
RUN ls

RUN unzip dcm2niix_lnx.zip -d /usr/local/bin
# Set the working directory in the container
WORKDIR /app

# Set the command to run the application
CMD [ "bash", "/app/dicom-to-nifti.sh" ]