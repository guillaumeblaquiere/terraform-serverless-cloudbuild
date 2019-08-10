# Overview
Example of project for deploy infrastructure with Terraform in a serverless way thanks to Cloud Build

## infrastructure
The project simply deploy a [Compute Engine](https://cloud.google.com/compute) micro-VM in us-central1, with Debian9 as boot disk image and in default network

# How to use

To start with the project
- Clone it: `git clone https://github.com/guillaumeblaquiere/terraform-serverless-cloudbuild.git`
- Go to the directory: `cd terraform-serverless-cloudbuild`
- Update the `main.tf` file, line 12, with the `bucket` name where the [terraform state](https://www.terraform.io/docs/state/) will be stored thanks to [GCS backend mode](https://www.terraform.io/docs/backends/types/gcs.html)

## How to deploy/update infrastructure
*Prerequisite*: gcloud is installed

Simply submit your project to Cloud Build: `gcloud builds submit`

The `cloudbuild.yaml` file is used by default

## How to destroy the infrastructure
Submit the `clouddestroy.yaml` file to Cloud Build: `gcloud builds submit --config clouddestroy.yaml`

# License

This library is licensed under Apache 2.0. Full license text is available in
[LICENSE](https://github.com/guillaumeblaquiere/terraform-serverless-cloudbuild/tree/master/LICENSE).

