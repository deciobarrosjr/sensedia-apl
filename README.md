# Sensedia  HelloWorld Application
<br>
To use this repository, the infra structure should already be provisioned on AWS.<br>
The following repository holds the Terraform Config Files to deploy the required infra structure to be used to delivery the application.<br>

https://github.com/deciobarrosjr/sensedia-infra

<br>

## About the Hello World application
The Hello World application is located on the folder <span style="color: Chocolate;">APL-HelloWorld</span> inside this repository.<br>
It´s a very simple Python application that basically uses the <span style="color: Chocolate;">Flask</span> Microframework to render a web page response as illustrated bellow:<br><br>

<div style="border: 2px solid gray; display: flex; justify-content: center; align-items: center; margin-left: 0px; width: 75%;">
	<img src="./images/hello-world.jpg" alt="Page rendered" style="width: 100%;">
</div>

<br>

The application will render the following information:<br>

> **Hostname:** the hostname of the node where the application is running on. The hostname is recovered by the application from the Operating System.
<br>

> **Service Type:** the Service Type is the value that is passed to the application using the <span style="color: Chocolate;">values.yaml</span> during the application deployment to the cluster. In this challenge it´s LoadBalancer.

<br>

## Requirements to deploy the application
The application deployment is done using a bash script called force-apply-all.


### Required repositories
This challenge uses two GitHub repositories as described bellow:<br>

> **sensedia-infra**: This GitHub repository will hold the infra structure provisioning config files.<br>
> **sensedia-apl**: This GitHub repository will hold the application, help and delivery terraform config files. 

### Required environment variables

<br>
<span style="color: pink;">PAT_DECIO_GITHUB</span>: to hold your PAT(Personal Access Token) with all the required access to run the pipeline. If you have your own PAT available on GitHub, you may just change the actual PAT_DECIO_GITHUB with your secret on the .github/workflows.<br>
<span style="color: pink;">AWS_ACCESS_KEY_ID</span>: This is your AWS access key ID. This access key ID, along with a corresponding secret access key, is used to authenticate and authorize requests made to AWS services via the AWS Command Line Interface (CLI).If you have your own AWS_ACCESS_KEY_ID available on GitHub, you may just change the actual AWS_ACCESS_KEY_ID with your secret on the .github/workflows.<br>
<span style="color: pink;">AWS_SECRET_ACCESS_KEY</span>: This is your AWS secret access key. If you have your own AWS_SECRET_ACCESS_KEY available on GitHub, you may just change the actual AWS_SECRET_ACCESS_KEY with your secret on the .github/workflows.<br>
<span style="color: pink;">TF_TOKEN_APP_TERRAFORM_IO</span>: This secret is used to authenticate Terraform Cloud or Terraform Enterprise when running Terraform commands. It stores the personal access token that grants access to your Terraform Cloud or Terraform Enterprise account.

### Required variables

<span style="color: pink;">PREFIX_NAME</span>: This is a prefix used on the deployments to compose the many resources being created by this workflow.<br>
<span style="color: pink;">AWS_REGION</span>: The region used to create the resources. The same region as the one used to create the infra structure.<br>
<span style="color: pink;">ACCOUNT_ID</span>: This is the AWS AccountID where the resources will be deployed.<br>

<br>

## Making changes on the application

To test a change applied to the application the best way to go is changing the file <span style="color: chocolate;">/APL-HelloWorld/templates/index.html</span>.<br>
You may, for example, change the color that will be used to render the page as illustrated bellow:<br>

<div style="border: 1px solid gray; display: inline-block; margin-left: 0px;">
    <img src="./images/page.jpg" alt="Changing page color.">
</div>

<br>

## Provisioning the application
I created a GitHub workflow to provision the application named <span style="color: chocolate;">CI Build for Sensedia Challenge</span>. The image bellow illustrated the workflow is configured for execution:<br>

<div style="border: 1px solid gray; display: inline-block; margin-left: 0px;">
    <img src="./images/create.jpg" alt="Manual workflow to createstroy resources.">
</div>

<br>

The workflow will be triggered everytime a push is done on the specified branches above.<br>
It can also be manuaaly executed as illustrated by the image bellow:

<br>

## Running the application locally on Visual Code

The following procedure should be use to execute the Python app inside the VC:<br>

Opem a terminal window on VC and change to the following folder: <span style="color: green;">APL-HelloWorld"</span><br>
Executes the following command: <span style="color: green;">python3 app.py</span>

<br>

## Accessing the application from the internet

<div style="border: 2px solid gray; display: flex; justify-content: center; align-items: center; margin-left: 0px; width: 75%;">
	<img src="./images/external-addr.jpg"
    .jpg" alt="External address" style="width: 100%;">
</div>

<br>

## Destroying the resources created

I created a manual GitHub workflow all the resources provisioned named <span style="color: chocolate;">Manual Destroy Workflow</span>. The image bellow illustrated how to execute this workflow:<br>

<div style="border: 1px solid gray; display: inline-block; margin-left: 0px;">
    <img src="./images/destroy-workflow.jpg" alt="Manual workflow to destroy resources.">
</div>

<br>

## Existing limitation

* **aws-actions/configure-aws-credentials@v3**: based on the best practices, this action was supposed to be using the OIDC provider. Will keep this way for simplicity but i will create a specific repo/POC to explain how to use the correct authentication mode.
