# Getting Started

JNDI Malicious Server - Reference Implementation

Open Terminal 

```
cp config/ssl_template  config/ssl
```

Populate the value in `config/ssl`

* EMAIL                   -> Valid Email ID
* BASE_DOMAIN             -> Base Domain that you have the ownership in AWS 
* AWS_ACCESS_KEY_ID       -> AWS Access Key
* AWS_SECRET_ACCESS_KEY   -> AWS Secret Key

```
./sandbox.bash 

Usage: ./sandbox.bash  {up|down|status|logs}

   up               Provision, Configure, Validate Application Stack
   down             Destroy Application Stack
   status           Displays Status of Application Stack
   logs             Application Stack Logs
```
## Traefik + SSL 

AWS Route53 DNS Challenge is being used for this. 

If you are the first timer, pls
1. Read about [ACME protocol and How it works](https://letsencrypt.org/how-it-works/)
2. [AWS Domain Registration](https://aws.amazon.com/getting-started/tutorials/get-a-domain/?trk=gs_card)
3. [AWS Account Registration](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc)


>> TLDR
   If you skip reading and configuring above steps - there are 80% chances you might not get this working :-)