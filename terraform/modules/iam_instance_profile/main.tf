resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.iam_instance_profile_name}"
  role = "${aws_iam_role.role.name}"
}

resource "aws_iam_role" "role" {
  name               = "${var.role_name}"
  path               = "/"
  assume_role_policy = "${file("${path.module}/${var.assume_role_policy}")}"
}
