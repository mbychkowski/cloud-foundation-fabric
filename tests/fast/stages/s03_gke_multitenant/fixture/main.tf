/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

# tfdoc: Data platform stage test

module "stage" {
  source = "../../../../../fast/stages/03-gke-multitenant/dev/"
  automation = {
    outputs_bucket = "test"
  }
  billing_account = {
    id              = "012345-67890A-BCDEF0",
    organization_id = 123456
  }
  clusters = {
    mycluster = {
      cluster_autoscaling = null
      description         = "My cluster"
      dns_domain          = null
      location            = "europe-west1"
      labels              = {}
      net = {
        master_range = "172.17.16.0/28"
        pods         = "pods"
        services     = "services"
        subnet       = "projects/my-host-project-id/regions/europe-west1/subnetworks/mycluster-subnet"
      }
      overrides = null
    }
  }
  nodepools = {
    mycluster = {
      mynodepool = {
        initial_node_count = 1
        node_count         = 1
        node_type          = "n2-standard-4"
        overrides          = null
        spot               = false
      }
    }
  }
  folder_ids = {
    gke-dev = "folders/12345678"
  }
  host_project_ids = {
    dev-spoke-0 = "fast-dev-net-spoke-0"
  }
  prefix = "fast"
  vpc_self_links = {
    dev-spoke-0 = "projects/fast-dev-net-spoke-0/global/networks/dev-spoke-0"
  }
}
