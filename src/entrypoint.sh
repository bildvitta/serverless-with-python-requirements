#!/bin/bash

ARGS=$1

echo "Check node Version"
node -v

echo "Check npm Version"
npm -v

echo "Check python Version"
python -V

echo "Installing Serverless and plugins..."
npm i serverless -g
npm i serverless-python-requirements
npm i serverless-plugin-canary-deployments

if [ "$ENVIRONMENT" ]; then
  echo "Running sls deploy $ARGS..."
  echo "Running sls deploy $AWS_SECRET_ACCESS_KEY..."
  echo "Running sls deploy $AWS_ACCESS_KEY_ID..."
  echo "Running sls deploy $ENVIRONMENT..."
else
  echo "Running sls deploy $ARGS..."
  if [ "$AWS_ACCESS_KEY_ID" ] && [ "$AWS_SECRET_ACCESS_KEY" ]; then
    sls config credentials --provider aws --key "$AWS_ACCESS_KEY_ID" --secret "$AWS_SECRET_ACCESS_KEY" "$ARGS"
  fi
  sls deploy "$ARGS"
fi
