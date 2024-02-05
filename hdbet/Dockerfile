
# Use an official Python runtime as the base image
FROM python:3.9

RUN apt-get update && apt-get install -y git

WORKDIR /root
# Clone the repository
RUN git clone https://github.com/MIC-DKFZ/HD-BET

RUN pip3 install -r ./HD-BET/requirements.txt

#Per default, model parameters will be downloaded to ~/hd-bet_params. 
#If you wish to use a different folder, 
# Change  HD_BET/paths.py here (e.g. regex) and modify folder_with_parameter_files

# Set the command to run the application
CMD [ "bash", "/app/hdbet.sh" ]
