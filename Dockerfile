FROM nvcr.io/nvidia/pytorch:22.05-py3

WORKDIR /

# Install python packages
RUN pip3 install --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Add your model weight files 
# (in this case we have a python script)
ADD src/download.py .
RUN python3 download.py

ADD src/ .

EXPOSE 8000

CMD python3 -u app.py
