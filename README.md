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


* Deploy the App in Azure App Service 
Replace <app-name> with the preferred name of the application. It should be unique 
```sh
az webapp up -n <app-name>  --sku B1
```

 Output : 
 ![image](https://user-images.githubusercontent.com/24310615/122690273-6ded8080-d220-11eb-9f57-2b9708c77b3a.png)

 Resource group: 
 ![image](https://user-images.githubusercontent.com/24310615/122690298-95444d80-d220-11eb-8d04-8087573903b7.png)

 
 

 * Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

 * Creation of Service Connection 
   Open the Azure DevOps project(create one if its not available)
   Navigate to Project Setting-> Service Connections -> Create a new Connection
 ![image](https://user-images.githubusercontent.com/24310615/122690247-50201b80-d220-11eb-8d13-38ac2d19007c.png)

  Choose Azure Resource Manager 
 
 ![image](https://user-images.githubusercontent.com/24310615/122690328-cde42700-d220-11eb-9197-0e82582a597f.png)

 
  Provide authentication when prompted, Select the Subscription, Web App name  and Save
 
 ![image](https://user-images.githubusercontent.com/24310615/122690371-14d21c80-d221-11eb-99b5-4414dc5daef7.png)

 * Creating pipeline

  Navigate to Pipeline -> Create a new Pipeline and Choose GitHub
 
 ![image](https://user-images.githubusercontent.com/24310615/122690420-667aa700-d221-11eb-9b84-321d98769513.png)
 
 
 
 Select the Repo containing the application code
 
 ![image](https://user-images.githubusercontent.com/24310615/122690433-7befd100-d221-11eb-82e1-d55eee76d09c.png)


 * Running Azure App Service from Azure Pipelines automatic deployment

  Configure the yml file, update the Service Connection id and the Web App name and Save the file
 ![image](https://user-images.githubusercontent.com/24310615/122690572-40093b80-d222-11eb-84f6-67e314d39c92.png)

 
 ![image](https://user-images.githubusercontent.com/24310615/122690849-b490aa00-d223-11eb-8519-34a99d2c300d.png)

 
 
* Successful prediction from deployed flask app in Azure Cloud Shell.

Modify the make_predict_azure_app.sh to connect to the App Service and execute the below command
![image](https://user-images.githubusercontent.com/24310615/122691032-f53cf300-d224-11eb-9287-25897a32a061.png)
 
 ```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
```
Output : 
 ![image](https://user-images.githubusercontent.com/24310615/122690995-c7f04500-d224-11eb-97df-7fed29dd11a8.png)

* Output of streamed log files from deployed application

View the logs using the below url. Replace <app-name> with the Deployed Application name
```sh
 https://<app-name>.scm.azurewebsites.net/api/logs/docker
```
 
 ![image](https://user-images.githubusercontent.com/24310615/122691072-303f2680-d225-11eb-9767-060a376e6769.png)

Streaming logs
 
 Logs can be stream using the command
 
 ```sh
 az webapp log tail
 ```

 Start streaming the log and make a predict call from another terminal

 Output:
 ![image](https://user-images.githubusercontent.com/24310615/122691532-23700200-d228-11eb-89c2-ff69056e82bb.png)

 
## Enhancements
* Add few more prediction models
* Build User interface for API
       
## Demo 

Demo video : https://www.youtube.com/watch?v=lqlmGUs_uA8
 
