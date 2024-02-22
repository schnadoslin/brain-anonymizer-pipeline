# Use an official Python runtime as the base image
FROM python:3.9

RUN apt-get update && apt-get install -y parallel


# Set the working directory in the container
WORKDIR /app

#https://github.com/KitwareMedical/dicom-anonymizer

RUN pip3 install dicom-anonymizer==1.0.11

#Per default, model parameters will be downloaded to ~/hd-bet_params. 
#If you wish to use a different folder, 
# Change  HD_BET/paths.py here (e.g. regex) and modify folder_with_parameter_files


# Set the command to run the application
CMD [ "bash", "/app/dicom-metadata-pruner.sh" ]



