# Deploy a Dart App on Section Tutorial

![workflow status](https://github.com/section/dart-tutorial/actions/workflows/workflows.yaml/badge.svg)

This repo holds the sample code for usage with the tutorials hosted on Section.io's documentations.

Refer to [Tutorials/Dart](https://www.section.io/docs/tutorials/frameworks/dart/) for detailed instructions on deploying to Section.

# Build and push dart image
```
USER=section
IMAGENAME=my-dart-app
TAG=0.0.1

docker build . --tag ghcr.io/$USER/$IMAGENAME:$TAG
docker push ghcr.io/$USER/$IMAGENAME:$TAG
```
