
setup:

	# source ~/.devops/bin/activate
	python3 -m venv ~/.udacity_capstone


	source ~/.udacity_capstone/bin/activate
	
install:

	echo "Installing: dependencies..."

	pip install --upgrade pip &&\
	    pip install -r app/requirements.txt


	echo "Installing: hadolint..."
	./bin/install_hadolint.sh
	echo

	echo "Installing: kubectl"
	./bin/install_kubectl.sh
	echo

	echo "Installing: eksctl"
	./bin/install_eksctl.sh
	
test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:

	# This is linter for Dockerfiles
	./bin/hadolint app/Dockerfile

	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202 app/app.py
	
run-app:
# run web application
	python3 app/app.py
	
build-docker:
#build docker with build_docker.sh
	./bin/build_docker.sh

run-docker: build-docker
#run docker with run_docker.sh
	./bin/run_docker.sh
	
upload-docker: build-docker
#upload docker container with upload_docker.sh
	./bin/upload_docker.sh
	
eks-create-cluster:
#create cluster with eks_create_cluster.sh	
	./bin/eks_create_cluster.sh	
