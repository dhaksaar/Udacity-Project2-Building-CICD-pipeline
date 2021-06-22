# List of commads used in Azure cloud shell

# To generate ssh-key get
ssh-keygen -t rsa

# To print the public key
cat ~/.ssh/id_rsa.pub

# To clone the repo 
git clone git@github.com:dhaksaar/Udacity-Project2-Building-CICD-pipeline.git

# To setup virtual environment 
python3 -m venv ~/.myapp
source ~/.myapp/bin/activate

#To run make all 
make all

#To deploy the web app in Azure App Service
az webapp up -n <app-name>  --sku B1

#To run the prediction 
./make_predict_azure_app.sh

#To Stream the log 
az webapp log tail

# Locust load test
locust -f locustfile.py --host https://<app-name>.azurewebsites.net/ --users 200 --spawn-rate 5
