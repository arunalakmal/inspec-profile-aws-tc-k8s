# Inspec Profile To Test The Deployed AWS Resources
Chef Inspec Profile to test the deployed AWS Resources
<br/>
<br/>
Used Inspec version: 4.19.2
<br/>
<br/>
Execute below command to run the inspec test <br/>
**Note:** `DEV_BUCKET` is one of the environment variables in my setup and it used to store the Terraform backend configuration.<br/>
I have added a test to check the availability of the bucket and the public accessibility.
<br/>
<br/>
`inspec exec inspec-profile-aws-tc-k8s -t aws:// --input bucketname="${DEV_BUCKET}"`
<br/>

I used this as the integration tests of my K8s custom environment and, GitLab pipline automatically triggers these tests after setting up the environment. <br/>

One important thing is "Accepting the licences", I have added the `CHEF_LICENSE=accept-no-persist` environment variable to automatically perform the licence acceptance when pipeline triggering the tests. 

![alt text](https://doc-0k-0s-docs.googleusercontent.com/docs/securesc/79d6tke0lmoscnm3a68e0h83uarqlp70/3ndg1f0uapsks72lfo02ul60sldpjpsu/1591540650000/12101571301910386988/12101571301910386988/1DRdrVV2TAWVS0scH644d2hqdr3AZdtDA?e=view&authuser=0 "Inspec output")
