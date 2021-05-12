# Workflow overview

Here we illustrate the structure of data analysis with MadMiner:

![MadMiner workflow][madminer-analysis-image]

The package is structured in the following sub-packages:

- `madminer.core`: functions to set up the process, parameter space, morphing, and to steer MadGraph and Pythia.
- `madminer.delphes`: contain one implementation for a detector simulation and observable calculation.
- `madminer.fisherinformation`: functions to calculate the Fisher information, both on parton and detector level.
- `madminer.lhe`: contain one alternative implementation for a detector simulation and observable calculation.
- `madminer.ml`: contains implementations for the ML part.
- `madminer.sampling`: train and test samples for the ML part (data generation and augmentation).


## Technical documentation
The MadMiner API is documented as well, just look through the pages linked on the left.


## Support
If you have any questions, please chat to us in our [Gitter community][madminer-gitter].


[madminer-analysis-image]: images/overview_analysis.jpg
[madminer-gitter]: https://gitter.im/madminer/community
