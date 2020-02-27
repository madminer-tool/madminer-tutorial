# MadMiner tutorial

This is a tutorial on [MadMiner](https://github.com/diana-hep/madminer) developed by Johann Brehmer, Felix Kling, Irina Espejo, and Kyle Cranmer. It is built using [Jupyter Book](https://jupyterbook.org/intro).

![](https://iris-hep.org/assets/logos/madminer.png)

## Introduction to MadMiner

Particle physics processes are usually modelled with complex Monte-Carlo simulations of the hard process, parton shower, and detector interactions. These simulators typically do not admit a tractable likelihood function: given a (potentially high-dimensional) set of observables, it is usually not possible to calculate the probability of these observables for some model parameters. Particle physicisists usually tackle this problem of “likelihood-free inference” by hand-picking a few “good” observables or summary statistics and filling histograms of them. But this conventional approach discards the information in all other observables and often does not scale well to high-dimensional problems.

In the three publications [“Constraining Effective Field Theories With Machine Learning”](https://arxiv.org/abs/1805.00013), [“A Guide to Constraining Effective Field Theories With Machine Learning”](https://arxiv.org/abs/1805.00020), and [“Mining gold from implicit models to improve likelihood-free inference”](https://arxiv.org/abs/1805.12244), a new approach has been developed. In a nut shell, additional information is extracted from the simulations that is closely related to the matrix elements that determine the hard process. This “augmented data” can be used to train neural networks to efficiently approximate arbitrary likelihood ratios. We playfully call this process “mining gold” from the simulator, since this information may be hard to get, but turns out to be very valuable for inference.

But the gold does not have to be hard to mine. This package automates these inference strategies. It wraps around the simulators MadGraph and Pythia, with different options for the detector simulation. All steps in the analysis chain from the simulation to the extraction of the augmented data, their processing, and the training and evaluation of the neural estimators are implemented.

## About the tutorial

This tutorial does not try to explain the theory behind the tool. To understand what MadMiner is doing, please look at the papers above for the theory. 

## The paper describing the MadMiner tool: 

Our main publication [MadMiner: Machine-learning-based inference for particle physics](https://arxiv.org/abs/1907.10621) provides an overview over this package. We recommend reading it first before jumping into the code.

## Documentation

Tutorials are nice, but they are no substitute for proper documentatin. Fortunately, 
MadMiner has extensive documentation on [readthedocs](https://madminer.readthedocs.io/en/latest/index.html).