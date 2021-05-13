# Choose your adventure

At this stage we will be generating simulated events, including the detector simulation.
We can either use:

- **Parton level** with a simple smearing (faster and **recommended** for the tutorial).
- **Delphes level** simulation (slower but more realistic).

The MadMiner techniques can also work with the full GEANT4 simulation of the events, but this is
too heavy and experiment-specific to package with the tool. The Delphes example provides a template
for what it would look like in a full experimental context.


## Set MadGraph directory
In tutorial sections:
- [**Parton level analysis**][tutorial-section-parton]
- [**Delphes level analysis**][tutorial-section-delphes]

The location of the MadGraph installation folder is set. It is listed as:

```python
mg_dir = '/madminer/software/MG5_aMC_v2_6_7'
```

If you install everything yourself, then you would also need to change this to point
to the MadGraph installation folder within your system.


[tutorial-section-parton]: notebooks/general/2a_parton_analysis.ipynb
[tutorial-section-delphes]: notebooks/general/2b_delphes_analysis.ipynb
