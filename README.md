# MadMiner tutorial

[![Binder][madminer-tutorial-binder-logo]][madminer-tutorial-binder-link]

This repository contains the source code for the [MadMiner tutorial website][madminer-tutorial-web].

MadMiner is a Physics simulation and ML inference tool created by Johann Brehmer, Felix Kling, Irina Espejo,
and Kyle Cranmer. The tutorial alongside the provided Docker images include contributions from Sinclert Pérez.


## Building the site
To build the website locally:

```shell
pip3 install -r requirements.txt
make build
```


## Deploying the site
The deployment is carry out **automatically** by a [GitHub Actions workflow][madminer-tutorial-workflow-web].


The tutorial will be deployed when any change is detected to the `book` directory, within the main repository branch.
The deployment workflow uses the popular [GH pages][github-pages-action] action in order to push a built version
of the tutorial into the [gh-pages][madminer-tutorial-branch-pages] branch.


[github-pages-action]: https://github.com/marketplace/actions/github-pages-action
[madminer-tutorial-web]: https://madminer-tool.github.io/madminer-tutorial
[madminer-tutorial-binder-link]: https://mybinder.org/v2/gh/cranmer/madminer-tutorial/master
[madminer-tutorial-binder-logo]: https://mybinder.org/badge_logo.svg
[madminer-tutorial-branch-pages]: https://github.com/madminer-tool/madminer-tutorial/tree/gh-pages
[madminer-tutorial-workflow-web]: https://github.com/madminer-tool/madminer-tutorial/blob/master/.github/workflows/web.yml
