FROM mcr.microsoft.com/vscode/devcontainers/python:3.8

# Install Jupyter and necessary Python packages
RUN pip install notebook ipykernel && \
    python -m ipykernel install --user --name=my_kernel

# Add any other dependencies your project needs here
