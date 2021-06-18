FROM python:3.8
MAINTAINER "Frederic Auberson"

RUN apt-get update && apt-get install -y \
    g++ \
	tini \
	bash \
	git \
	openssh-client \
    && rm -rf /var/lib/apt/lists/*
	
RUN pip3 install tensorflow-gpu

RUN pip3 install pandas

RUN pip3 install numpy \
        sklearn \
        matplotlib \
        seaborn \
        jupyter \
        pyyaml \
		pre-commit \
		graphviz \
		pydot-ng \
        h5py \
		tensorflow-addons && \
    pip3 install keras --no-deps && \
	pip3 install "tqdm>=4.36.1" && \
    pip3 install imutils

COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Jupyter and Tensorboard ports
EXPOSE 8888 6006

# Store notebooks in this mounted directory
RUN ["mkdir", "git"]
VOLUME /git

# Use Tini: It will reap zombie processes and prevent crashes in some situations
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
