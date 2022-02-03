 #Create a IAM group
resource "aws_iam_group" "devops_support" {
  name = "devops_support"
}

#create policy attachment to the group

resource "aws_iam_policy_attachment" "devops_attachment" {

  name = "devops_attachment"
  groups = aws_iam_group.devops_support.name
  policy_arn = "${"arn:aws:iam::aws:policy/AdministratorAccess"}"
}

# create iam user
resource "aws_iam_user" "cd_devops" {
  name = "csgdevopsadmin-1"
}


# add users to the group.
resource "aws_iam_group_membership" "devopsusers" {
    name = "devopsusers"
    users = [aws_iam_user.cd_devops.name]
    group = "${aws_iam_group.devops_support.name}"
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.cd_devops.name
}

resource "aws_iam_user_policy" "user_policy" {
  name = "devops_admin_access"
  user = aws_iam_user.cd_devops.name

 policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}