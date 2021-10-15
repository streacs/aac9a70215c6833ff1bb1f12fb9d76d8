#------------------------------------------------------
# TERRAFORM STATE
#------------------------------------------------------
remote_state {
  include {
    path = find_in_parent_folders()
  }
}
