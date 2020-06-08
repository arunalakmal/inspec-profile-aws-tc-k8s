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

or Run directly with the GitHub Repo

`inspec exec https://github.com/ArunaLakmal/inspec-profile-aws-tc-k8s.git -t aws:// --input bucketname="${DEV_BUCKET}"`

I used this as the integration tests of my K8s custom environment and, GitLab pipline automatically triggers these tests after setting up the environment. <br/>

One important thing is "Accepting the licences", I have added the `CHEF_LICENSE=accept-no-persist` environment variable to automatically perform the licence acceptance when pipeline triggering the tests. 

Here is the output of the above test:

![alt text](https://github.com/ArunaLakmal/inspec-profile-aws-tc-k8s/blob/master/images/Screen%20Shot%202020-06-07%20at%207.07.04%20PM.png "inspec output")
