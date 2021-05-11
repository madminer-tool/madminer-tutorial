# Introduction

This is a tutorial on [MadMiner][madminer-github] developed by Johann Brehmer, Felix Kling, Irina Espejo, and Kyle Cranmer.
Sinclert Pérez made major contributions to the Docker containers and workflows, and documentation for running MadMiner on REANA.
Matthew Feickert helped with Binder and streamlined docker files. The site is built using [Jupyter Book][jupyter-books-web].

![Madminer logo][madminer-logo]


## Introduction to MadMiner
Particle physics processes are usually modelled with complex Monte-Carlo simulations of the hard process, parton shower,
and detector interactions. These simulators typically do not admit a tractable likelihood function: given a (potentially high-dimensional)
set of observables, it is usually not possible to calculate the probability of these observables for some model parameters.
Particle physicists usually tackle this problem of “likelihood-free inference” by hand-picking a few “good” observables or
summary statistics and filling histograms of them. However, this conventional approach discards the information in all 
other observables and often does not scale well to high-dimensional problems.

In the three publications
[“Constraining Effective Field Theories With Machine Learning”][madminer-paper-1],
[“A Guide to Constraining Effective Field Theories With Machine Learning”][madminer-paper-2], and
[“Mining gold from implicit models to improve likelihood-free inference”][madminer-paper-3], a new approach has been developed.
In a nutshell, additional information is extracted from the simulations that is closely related to the matrix elements
that determine the hard process. This “augmented data” can be used to train neural networks to efficiently approximate
arbitrary likelihood ratios. We playfully call this process “mining gold” from the simulator, since this information
may be hard to get, but turns out to be very valuable for inference.

But the gold does not have to be hard to mine. This package automates these inference strategies. It wraps around
the simulators MadGraph and Pythia, with different options for the detector simulation. All steps in the analysis chain
from the simulation to the extraction of the augmented data, their processing, and the training and evaluation
of the neural estimators are implemented.


## About the tutorial
This tutorial does not try to explain the theory behind the tool. To understand what MadMiner is doing, please look
at the papers above for the theory. 


## The paper describing the MadMiner tool:
Our main publication [MadMiner: Machine-learning-based inference for particle physics][madminer-paper-main] provides
an overview over this package. We recommend reading it first before jumping into the code.


## Documentation
Tutorials are nice, but they are no substitute for proper documentation.
Fortunately, MadMiner has an extensive documentation on [read-the-docs][madminer-docs-web].


[jupyter-books-web]: https://jupyterbook.org/intro
[madminer-docs-web]: https://madminer.readthedocs.io/en/latest/index.html
[madminer-github]: https://github.com/diana-hep/madminer
[madminer-logo]: https://iris-hep.org/assets/logos/madminer.png
[madminer-paper-1]: https://arxiv.org/abs/1805.00013
[madminer-paper-2]: https://arxiv.org/abs/1805.00020
[madminer-paper-3]: https://arxiv.org/abs/1805.12244
[madminer-paper-main]: https://arxiv.org/abs/1907.10621
