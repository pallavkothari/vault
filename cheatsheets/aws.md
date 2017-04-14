## aws

```bash
vault mount aws
vault write aws/config/root \
    access_key=<YOUR_ACCESS_KEY> \
    secret_key=<YOUR_SECRET_KEY> \
    region=us-east-1

vault write aws/roles/test policy=@aws-policy.json

vault write aws/config/lease lease=1200s lease_max=3600s

vault read aws/creds/test

aws iam list-users
```