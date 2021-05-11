# Choose your adventure

At this stage we will be training a neural network to approximate a _likelihood_ or a _likelihood ratio_
for down-stream statistical analysis. The papers mentioned in the [Introduction][tutorial-section-intro]
describe these techniques in detail. There are basically three options for this step:

- An approximate likelihood ratio (**recommended** for the tutorial, ~20 min).
- An approximate score, which is like the optimal observables (**stretch goal** for the tutorial).
- An approximate likelihood (like a high-dimensional histogram, but with a neural network).

This is where the machine learning training happens, and MadMiner uses Pytorch.


[tutorial-section-intro]: 0_intro.md
