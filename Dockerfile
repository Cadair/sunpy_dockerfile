FROM continuumio/anaconda

# Install SunPy
RUN conda config --add channels sunpy && conda install --yes sunpy

# Force mpl to use Agg by default
RUN echo "backend: Agg" >> /opt/conda/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc

# Add a SunPy user
RUN useradd -m -s /bin/bash sunpy
RUN chmod -R a+rwx /opt/conda && chown sunpy /home/sunpy
RUN echo "export PATH=/opt/conda/bin:$PATH" >> /home/sunpy/.bashrc

# Get a Shell
CMD /bin/bash -c "su sunpy"
