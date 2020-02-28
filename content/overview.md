
## Typical work flow

Here we illustrate the structure of data analysis with MadMiner:

![MadMiner workflow](images/workflow_combined.jpg)

- `madminer.core` contains the functions to set up the process, parameter space, morphing, and to steer MadGraph and
   Pythia.
- `madminer.lhe` and `madminer.delphes` contain two example implementations of a detector simulation and observable
   calculation. This part can easily be swapped out depending on the use case.
- In `madminer.sampling`, train and test samples for the machine learning part are generated and augmented with the
  joint score and joint ratio.
- `madminer.ml`  contains an implementation of the machine learning part. The user can train and evaluate estimators
  for the likelihood ratio or score.
- Finally,  `madminer.fisherinformation` contains functions to calculate the Fisher information, both on parton level
  or detector level, in the full process, individual observables, or the total cross section.


## Technical documentation

The madminer API is documented on here as well, just look through the pages linked on the left.


## Support

If you have any questions, please
chat to us [in our Gitter community](https://gitter.im/madminer/community) or write us at 
[johann.brehmer@nyu.edu](johann.brehmer@nyu.edu).