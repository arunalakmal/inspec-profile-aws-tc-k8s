# Inspec Profile To Test The Deployed AWS Resources
Chef Inspec Profile to test the deployed AWS Resources

Execute below command to run the inspec test 
Note: DEV_BUCKET is one of the environment variables in my setup
`inspec exec inspec-profile-aws-tc-k8s -t aws:// --input bucketname="${DEV_BUCKET}"`
