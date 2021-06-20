# Overview

In this project, you will build a Github repository from scratch and create a scaffolding that will assist you in performing both Continuous Integration and Continuous Delivery. You'll use Github Actions along with a Makefile, requirements.txt and application code to perform an initial lint, test, and install cycle. Next, you'll integrate this project with Azure Pipelines to enable Continuous Delivery to Azure App Service.

![image](https://user-images.githubusercontent.com/24310615/122680602-e7b54800-d1e7-11eb-8db4-f54256ba388a.png)


## Project Plan


* Link to the Trello board for the project https://trello.com/b/aZvUh4wL/udacity-devops-azure-project-2
* Link to a spreadsheet that includes the original and final project plan https://docs.google.com/spreadsheets/d/1zAT2ziUFgRhUltKSPn2ulCKt6H7PDlzjHTGCNyTsp6g/edit?usp=sharing

## Instructions

### Continuous Integration with GitHub Actions

* Architectural Diagram 

![image](https://user-images.githubusercontent.com/24310615/122688100-3081f680-d212-11eb-8610-bd79283d5d91.png)

* Enter to Azure Portal with your account and open a Azure Cloud shell ( use Bash)

* Step1 : Set up SSH Keys in your Azure Cloud Shell and add the id_rsa.pub key to your GitHub repo ( ssh keys) 

```sh
ssh-keygen -t rsa
 cat ~/.ssh/id_rsa.pub
```

* Step 2: Clone the repo in Azure Cloud Shell
* Step 3: Create a virtual environment for the application.

```sh
python3 -m venv ~/.myapp
source ~/.myapp/bin/activate
```

* Step 4: Run `make all` which will install, lint, and test code

```sh
make all
```

Output from make all :
![image](https://user-images.githubusercontent.com/24310615/122688443-18ab7200-d214-11eb-9dab-850105348694.png)

* Step 5: GitHub Actions
  Modify the .github/workflows/pythonapp.yml either through GitHub or through Azure cloud shell editor (vim) , just add a new line or a space in the end of the file and commit
  This would trigger the GitHub action
  Output
![image](https://user-images.githubusercontent.com/24310615/122688545-c454c200-d214-11eb-809c-1c8d6084cd84.png)


### Continuous Delivery using Azure Pipelines

* Architecture Diagram
![image](https://user-images.githubusercontent.com/24310615/122688774-219d4300-d216-11eb-97f8-31ffaface356.png)


* Step 1: Deploy the App in Azure App Service 
Replace <<app service name>> with the preferred name of the application. It should be unique 
```sh
az webapp up -n <<app service name>>  --sku B1
```

 Output 
 ![image](https://user-images.githubusercontent.com/24310615/122690273-6ded8080-d220-11eb-9f57-2b9708c77b3a.png)

 Resource group: 
 ![image](https://user-images.githubusercontent.com/24310615/122690298-95444d80-d220-11eb-8d04-8087573903b7.png)

 
 
* Step 2: 
 
Service Connection 
 ![image](https://user-images.githubusercontent.com/24310615/122690247-50201b80-d220-11eb-8d13-38ac2d19007c.png)

 ![image](https://user-images.githubusercontent.com/24310615/122690328-cde42700-d220-11eb-9197-0e82582a597f.png)

 ![image](https://user-images.githubusercontent.com/24310615/122690371-14d21c80-d221-11eb-99b5-4414dc5daef7.png)

 Creating pipeline

 ![image](https://user-images.githubusercontent.com/24310615/122690420-667aa700-d221-11eb-9b84-321d98769513.png)

 ![image](https://user-images.githubusercontent.com/24310615/122690433-7befd100-d221-11eb-82e1-d55eee76d09c.png)

 
 ![image](https://user-images.githubusercontent.com/24310615/122690572-40093b80-d222-11eb-84f6-67e314d39c92.png)

 Output  : 
 
 

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


