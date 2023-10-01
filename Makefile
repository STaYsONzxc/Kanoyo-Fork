.PHONY:
.ONESHELL:

help: ## Show this help and exit
	@grep -hE '^[A-Za-z0-9_ \-]*?:.*##.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies (Do everytime you start up a paperspace machine)
	apt-get -y install build-essential python3-dev ffmpeg
	pip install --upgrade setuptools wheel
	pip install --upgrade pip
	pip install faiss-gpu fairseq gradio ffmpeg ffmpeg-python praat-parselmouth pyworld numpy==1.23.5 numba==0.56.4 librosa==0.9.1
	pip install -r assets/requirements/requirements.txt
	pip install --upgrade lxml
	apt-get update
	apt -y install -qq aria2


run-ui: ## Run the python GUI
	python infer-web.py --paperspace --pycmd python

run-cli: ## Run the python CLI
	python infer-web.py --pycmd python --is_cli

tensorboard: ## Start the tensorboard (Run on separate terminal)
	echo https://tensorboard-$$(hostname).clg07azjl.paperspacegradient.com
	tensorboard --logdir logs --bind_all