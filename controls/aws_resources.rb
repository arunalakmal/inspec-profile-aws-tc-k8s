# control "Sample Contorl" do
#   impact 0.9
#   title "Sample Title"

#   Replace this placeholder with test
# end
bucketname = attribute('bucketname')

control "AWS S3" do
  impact 0.7
  title "Check AWS Backend S3 Buckets"

  describe aws_s3_bucket(bucket_name: bucketname) do
    it { should exist }
    it { should_not be_public }
  end
end

control "AWS EC2" do
  impact 0.9
  title "Check AWS EC2 Node Count"

  describe aws_ec2_instances do
    its('instance_ids.count') { should cmp 4 }
  end
end

control "AWS EC2 AMI" do
  impact 0.9
  title "Check AWS EC2 Instance AMI"
  
  aws_ec2_instances.instance_ids.each do |instance_id|
    describe aws_ec2_instance(instance_id) do
      it              { should_not have_roles }
      its('key_name') { should cmp 'ironman' }
      its('image_id') { should eq 'ami-00dc79254d0461090' }
    end 
  end
end

control "AWS Security Group" do
  impact 0.9
  title "Check Security Group Availability"

  describe aws_security_group(group_name: 'tc_kubeadm_sg') do
    it { should exist }
  end
end

control "SSH Access" do
  impact 0.8
  title "Check Security Group Access for SSH"

  describe aws_security_group(group_name: 'tc_kubeadm_sg') do
    it { should allow_in(port: 22, ipv4_range: '0.0.0.0/0') }
  end  
end
