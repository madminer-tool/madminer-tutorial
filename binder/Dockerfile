FROM madminertool/madminer-jupyter-env:0.3.4

USER root

# c.f. https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html#preparing-your-dockerfile
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
WORKDIR ${HOME}

RUN adduser \
    --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

RUN python3 -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    python3 -m pip install --no-cache-dir --upgrade \
        "notebook~=5.7" \
        "jupyter" \
        "metakernel" \
        "zmq"

# Make sure the contents of our repo are in ${HOME}
COPY content ${HOME}/content
COPY binder ${HOME}/binder
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

RUN python3 -m pip install --no-cache-dir -r binder/requirements.txt

# Specify the default command to run
ENTRYPOINT []
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
