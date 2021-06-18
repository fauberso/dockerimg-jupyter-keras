# Get the config object
c = get_config()
# Inline figures when using Matplotlib
c.IPKernelApp.pylab = 'inline'
c.NotebookApp.ip = '*'
c.NotebookApp.allow_remote_access = True
# Do not open a browser window by default when using notebooks
c.NotebookApp.open_browser = False
# INSECURE: No token. Always use jupyter over ssh tunnel
c.NotebookApp.token = ''
c.NotebookApp.notebook_dir = '/git'
# Allow to run Jupyter from root user inside Docker container
c.NotebookApp.allow_root = True