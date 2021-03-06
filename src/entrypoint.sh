#!/bin/bash

ARGS=$1

echo "Check node Version"
node -v

echo "Check npm Version"
npm -v

echo "Check python Version"
python -V

echo "Installing Serverless..."
npm i serverless -g

echo "Installing Pipenv and Poetry..."
pip install pipenv poetry

echo "Check package.json"
if [[ ! -f "$GITHUB_WORKSPACE/package-lock.json" ]]; then
  echo "Installing Serverless plugins..."
  npm i serverless-python-requirements
  npm i serverless-plugin-canary-deployments
else
  echo "Installing Serverless local plugins..."
  npm install
fi

if [ "$ENVIRONMENT" ]; then
  echo "Running sls deploy $ARGS..."
  echo "Running sls deploy $AWS_SECRET_ACCESS_KEY..."
  echo "Running sls deploy $AWS_ACCESS_KEY_ID..."
  echo "Running sls deploy $ENVIRONMENT..."
  echo "sls config credentials --provider aws --key $AWS_ACCESS_KEY_ID --secret $AWS_SECRET_ACCESS_KEY"
  echo "sls deploy $ARGS"
else
  echo "Running sls deploy $ARGS..."
  if [ "$AWS_ACCESS_KEY_ID" ] && [ "$AWS_SECRET_ACCESS_KEY" ]; then
    echo "sls config credentials $ARGS..."
    sls config credentials --provider aws --key "$AWS_ACCESS_KEY_ID" --secret "$AWS_SECRET_ACCESS_KEY"
  fi
  echo "Running sls deploy $ARGS..."
  sls deploy $ARGS -v
fi
