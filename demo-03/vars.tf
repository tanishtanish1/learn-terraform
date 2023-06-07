variable "sample" {
  default = 100
}
variable "sample1" {
  default = "hello world"
}
output "sample" {
  value = "var.sample"
}
output "sample1" {
  value = "var.sample1"
}
output "sample-txt" {
  value = "value of sample - ${var.sample}"
}

#plain
variable "course1" {
  default = "dev training"
}

#list
variable "course2" {
  default = ["java","python","rubu", "javascript"  ]
}
#map
variable "course3" {
  default = {
    devops={
      name="dev"
      trainer="rahhu"
      fee    =20000

  }
    aws={
      namee="dev1"
      trainer="siva"
      fee    =20000
    }

  }
}

output "course1" {
  value = "var.course1"
}
output "course2" {
  value = "var.course2"
}
output "course3" {
  value = "var.course3"
}