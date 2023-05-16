import boto3
  
ec2 = boto3.resource('ec2')

def get_instance_status_onid(instance_id):
    for instance in ec2.instances.all():
        if instance.id == instance_id:
            return instance.state["Name"]

def get_running_instances():
    for instance in ec2.instances.all():
        if instance.state["Name"] == 'running':
            return instance.id

print(f'Getting the status of instance i-02b80fd780df59846 - {get_instance_status_onid("i-02b80fd780df59846")}')

print(f'All running ec2 in ap-south-1 {get_running_instances()}')
