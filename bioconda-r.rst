Bioconda & R
============

This is a suggested procedure for using R on the cluster. It's by no means the only way to do this but it’s an approach that's tried and tested and lets conda deal with the issue of R package dependencies, which appears to be a more reliable approach than using R itself for package management.

.. important::
  Ensure you've installed conda using the instructions given on the :doc:`bioconda` page. **Do not** install it via any other method.

First, create a dedicated conda environment which will contain R and any packages subsequently added to it. In this example, we'll install a specific version (4.5), so we'll call the environment r4.5::

  $ conda create --name r4.5 r=4.5

Let’s assume we now want to add an R package, for example ``ggplot2``, which we can find via ``conda search``. The convention for packaging R packages in conda is to prefix the name of the R package with ``r-``, so in this case ``r-ggplot2``::

  $ conda search r-ggplot2

This returns a lot of version entries for ``r-ggplot2`` and confirms that a conda version of this R package is available (output shown here is truncated)::

  Loading channels: done
  # Name                       Version           Build  Channel
  r-ggplot2                      2.0.0        r3.2.2_0  bioconda
  r-ggplot2                      2.1.0        r3.2.2_0  bioconda
  r-ggplot2                      2.1.0        r3.3.1_0  bioconda
  r-ggplot2                      2.2.0        r3.3.1_0  bioconda
  r-ggplot2                      2.2.0        r3.3.2_0  conda-forge
  r-ggplot2                      2.2.0        r3.4.1_0  conda-forge
  r-ggplot2                      2.2.1        r3.3.1_0  bioconda
  r-ggplot2                      2.2.1        r3.3.2_0  conda-forge
  [...]

Let's install the package into our dedicated R environment. First, we need to activate it::

  $ conda activate r4.5

This should be reflected by a change in your command prompt::

  (r4.5) username@gruffalo:~$

Anything we install with conda will now be installed into this environment::

  $ conda install r-ggplot2

Conda will handle all the dependency management and also install other packages required by ggplot2.

.. tip::
  Additional R packages can be installed into the conda R environment as described above.

.. note::
  The advantages to this approach over "traditional"” install-into-command-line-R-directly include dependency management (handled seamlessly by conda) and a full record of which R packages and versions are installed can easily be obtained. You can export this list (``conda env export --name r4.5 > r4.5.yml``) which is useful if you need to migrate the environment to another system and/or share with another user.

Once we have our packages installed, we can use them in our scripts. The following is an example of submitting an R job with Slurm::

  #!/bin/bash
  #SBATCH --job-name="Example R Script"

  # Activate our conda R environment
  conda activate r4.5

  # Run an R script that uses ggplot2 etc
  Rscript myPlottingScript.r

  # If running any other steps after this, don’t forget to deactivate the environment
  conda deactivate

You can also submit R jobs directly to Slurm::

  $ conda activate r4.5
  $ sbatch –wrap "Rscript myPlottingScript.r"

.. tip::
  It's highly recommend to run all your R code from within scripts as opposed to through platforms like RStudio where reproducibility requirements are generally not satisfied. Once you've got your code in a script, it can be tweaked and re-executed readily and it'll also be ready for submission to e.g. a Github account as part of your publication requirements.


.. raw:: html

   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
