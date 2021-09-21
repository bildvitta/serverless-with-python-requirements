#!/bin/bash

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

echo "Running sls deploy $1..."
#if [ "${process.env.AWS_ACCESS_KEY_ID}" ] && [ ${process.env.AWS_SECRET_ACCESS_KEY} ]; then
#  sls config credentials --provider aws --key ${process.env.AWS_ACCESS_KEY_ID} --secret ${process.env.AWS_SECRET_ACCESS_KEY} ${ARGS}
#fi
#
#
#sls deploy "${ARGS}"
