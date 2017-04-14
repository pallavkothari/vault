## aws

```bash
vault mount aws
vault write aws/config/root \
    access_key=$(cat ~/.aws/credentials | grep aws_access_key_id | head -1 | cut -d' ' -f3) \
    secret_key=$(cat ~/.aws/credentials | grep aws_secret_access_key | head -1 | cut -d' ' -f3) \
    region=us-east-1

vault write aws/roles/test policy=@aws-policy.json

vault write aws/config/lease lease=1200s lease_max=3600s

vault read aws/creds/test

aws iam list-users
```