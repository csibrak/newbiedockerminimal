
# Dockerfile
#Small python package
FROM python:3.8-slim

#Setting the work dir, the path to start a script
WORKDIR /app

#Copy all neccessary files to install the app
COPY requirements.txt ./
#Installation process in buld time
RUN pip install --no-cache-dir -r requirements.txt

#copy the app files to the image (you can copy a full folder)
COPY main.py ./

#Run the command to start runtime, entrypoint also works to start a container.
CMD [ "python", "./main.py" ]
#CMD ["Main app to run" , "arg1, like python file" , "other args" ]
