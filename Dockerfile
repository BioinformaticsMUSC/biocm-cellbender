FROM nvcr.io/nvidia/pytorch:18.11-py3

RUN conda install -c anaconda pytables

RUN git clone https://github.com/broadinstitute/CellBender.git
RUN pip install -e CellBender 

RUN git clone https://github.com/ttgump/scDeepCluster_pytorch.git

CMD ["python"]
