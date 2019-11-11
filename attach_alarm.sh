# Attaches the alarm to ASG at run time from an instance.

# Use cases: CodeDeploy BlueGreen deployments. 
# New ASGs (Green env) do not have alarms automatically attached for monitoring things like CPU Utilization. 
# You can do it at run time.
# Run this at the 'AfterAllowTraffic' LifeCycle hook.



# Get instance ID of the running instance from its meta-data.
export EC2_INSTANCE_ID="`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`"

# Get the asg name attached to this instance.
export asg_name="`aws autoscaling describe-auto-scaling-instances --instance-ids $EC2_INSTANCE_ID --query 'AutoScalingInstances[0].AutoScalingGroupName' --region eu-west-1`"

# Attach the alarm cpu-monitoring to this AutoScaling Group.
aws cloudwatch put-metric-alarm --alarm-name cpu-monitoring --alarm-description "Alarm when CPU exceeds 70%" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Sum --period 60 --threshold 70 --comparison-operator GreaterThanThreshold --dimensions  Name=AutoScalingGroupName,Value=$asg_name --evaluation-periods 1 --alarm-actions "<SNS_ARN" "SNS_ARN" --unit Percent --region <region>
