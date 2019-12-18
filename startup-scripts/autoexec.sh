## place where we put the sources that get re-downloaded each time the user starts the server
rm -rf .managed-sources
mkdir .managed-sources

## download the genesis streaming client library
## we don't bake it into the notebook image as it's still in heavy development and changes frequently
## hack: link additional libs from ~/.ipython, which shows up on the $PYTHONPATH
git clone https://github.com/astronomy-commons/genesis-client .managed-sources/genesis-client
mkdir -p .ipython
rm -f .ipython/genesis
ln -s ../.managed-sources/genesis-client/genesis .ipython/genesis
pip install numpy scipy matplotlib astropy astroML scikit-learn pymc3 tensorflow-gpu pandas

## downlaod genesis demo
gitpuller https://github.com/astroML/astroML-workshop_AAS235 master astroML-workshop
