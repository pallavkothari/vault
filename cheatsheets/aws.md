## aws

```bash
# aws
vault mount aws
vault write aws/config/root \
    access_key=<YOUR_ACCESS_KEY> \
    secret_key=<YOUR_SECRET_KEY> \
    region=us-east-1

vault write aws/config/lease lease=1200s lease_max=3600s


```