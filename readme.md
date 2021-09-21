# serverless-with-python-requirements

An action to deploy serverless projects made in python

## Inputs

## `args`

Additional arguments you want to set. Default `""`.

## Environment Variables

### `aws-access-key-id`

**Conditional** Your aws access key id.

### `aws-secret-access-key`

**Conditional** Your aws secret access key.

### `serverless-access-key`

**Conditional** Your serverless access key.

## Example usage

```yaml
  - name: Serverless Deploy
    uses: bildvitta/serverless-with-python-requirements@master
    with:
      args: '--stage dev'
    env:
      AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
      AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

#### AWS Credentials
```yaml
- name: Set up Node
  uses: actions/setup-node@v1
  with:
    node-version: 12

- name: Set up Python
  uses: actions/setup-python@v2
  with:
    python-version: 3.8  # Update with your python version

- name: Serverless Deploy
  uses: bildvitta/serverless-with-python-requirements@master
  with:
    args: '--stage dev'
  env:
    AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
    AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

#### Serverless Access Key
```yaml
- name: Set up Node
  uses: actions/setup-node@v1
  with:
    node-version: 12

- name: Set up Python
  uses: actions/setup-python@v2
  with:
    python-version: 3.8  # Update with your python version

- name: Serverless Deploy
  uses: bildvitta/serverless-with-python-requirements@master
  with:
    args: '--stage dev'
  env:
    SERVERLESS_ACCESS_KEY: ${{ secrets.SERVERLESS_ACCESS_KEY }}
```
