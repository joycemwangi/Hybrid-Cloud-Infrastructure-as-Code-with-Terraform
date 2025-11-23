
# Terraform IaC Hybrid Deployments

Automated Terraform IaC framework for **hybrid cloud** and **multi-vendor network automation**.  
Supports AWS, Azure, GCP, OCI (demo), and network/security platforms such as **Cisco ACI/IOS/SD-Access & Panorama**, **Palo Alto**, **Fortinet**, **Juniper**, **F5**, **Infoblox**, **Zscaler**, and **Check Point**.

This repo is designed as a **portfolio / reference implementation** to show how you structure multi-cloud, multi-vendor automation **safely**.

---   

## 🔧 Features

- **Hybrid-cloud IaC**
  - AWS VPC + subnet
  - Azure resource group
  - GCP VPC network + subnet
  - OCI VCN + subnet (using *demo* OCIDs by default)

- **Network & security vendors**
  - Cisco IOS / NX-OS
  - Cisco ACI
  - Cisco SD-Access
  - Palo Alto firewalls + Panorama
  - Fortinet / FortiGate
  - Juniper
  - F5 BIG-IP
  - Infoblox
  - Zscaler
  - Check Point

- **Safe “demo mode”**
  - Cloud providers are wired for real use but require credentials.
  - Vendor modules use `null_resource` with `triggers` – you can see planned changes **without touching real devices**.
  - OCI uses **dummy OCIDs** by default so it never hits a real tenancy.

- **GitHub Actions CI**
  - `terraform.yml` – Terraform **fmt + init + validate**
  - `terraform-docs.yml` – Auto-generate module docs into `README.md` snippets
  - `tflint.yml` – **TFLint static analysis (soft-fail)** for Terraform best practices
  - `checkov.yml` – **Checkov security scan (soft-fail)** for IaC misconfigurations
  - `terraform-fmt-autocommit.yml` – optional **auto-format & auto-commit** on PRs
  - `infracost.yml` – **Infracost “presentation mode”** (only runs if `INFRACOST_API_KEY` secret is set; otherwise it’s a no-op and never fails)

---

## 📁 Repository Structure

```text
.
├── main.tf                  # Root module wiring all sub-modules
├── variables.tf             # Input variable definitions
├── terraform.tfvars         # Local variable values (git-ignored)
├── terraform.tfvars.example # Sample config with safe demo values
├── modules/
│   ├── aws/                 # AWS VPC + subnet
│   ├── azure/               # Azure resource group
│   ├── gcp/                 # GCP VPC network + subnet
│   ├── oci/                 # OCI VCN + subnet (demo OCIDs)
│   ├── aci/                 # Cisco ACI
│   ├── cisco_ios/           # Cisco IOS / NX-OS
│   ├── juniper/             # Juniper devices
│   ├── paloalto/            # Palo Alto firewall objects
│   ├── panorama-access/     # Panorama admin users
│   ├── fortinet/            # Fortinet address objects
│   ├── checkpoint/          # Check Point host objects
│   ├── f5/                  # F5 virtual server (null_resource)
│   ├── infoblox/            # Infoblox DNS records (null_resource)
│   ├── zscaler/             # Zscaler rules (null_resource)
│   └── sd_access/           # Cisco SD-Access fabric placeholder
└── .github/workflows/
    ├── terraform.yml                # Validate Terraform
    ├── terraform-docs.yml           # Generate docs
    ├── terraform-fmt-autocommit.yml # Auto-format on PRs
    ├── tflint.yml                   # TFLint (soft-fail)
    ├── checkov.yml                  # Checkov (soft-fail)
    └── infracost.yml                # Cost estimation stub
```

**✅ Prerequisites**
- **Terraform** ≥ 1.3
- Git

- (Optional) Cloud CLIs and credentials if you actually want to deploy:

  - AWS credentials (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, etc.)

  - Azure credentials (Service Principal or `az login`)

  - GCP Application Default Credentials

  - OCI config + API keys

- Access to any vendor platforms you want to target (Palo Alto, Fortinet, F5, etc.)

> 💡 You can run everything in safe demo mode WITHOUT real credentials.
Terraform will validate and plan successfully, but will not apply changes to real cloud accounts.


##

###
## 🚀 Getting Started

### 1. Clone the repository

``` bash
git clone https://github.com/joycemwangi/terraform-iac-hybrid-deployments.git
cd terraform-iac-hybrid-deployments
```

##

###
### 2. Create your local variable file

Copy the example file and edit it locally:
``` bash
cp terraform.tfvars.example terraform.tfvars
```
Edit `terraform.tfvars` to match whatever you want to demonstrate (you can keep all the fake/demo values – they are safe).


##

###
### 3. (Optional) Adjust demo OCI values

By default, OCI uses **fake demo values:**
``` bash
oci_compartment_id   = "ocid1.compartment.oc1..demoexamplecompartmentid"
oci_vcn_display_name = "demo-vcn"
oci_subnet_cidr      = "10.30.0.0/24"
```
If you don’t have an OCI tenancy, **leave these as-is.** Terraform will still validate and plan because no real credentials are configured.

##

###
### 4. Initialize Terraform
``` bash
terraform init
```
This downloads all required providers and sets up the working directory.

##

###
### 5. Validate
``` bash
terraform fmt
terraform validate
```
- `terraform fmt` keeps the code consistently formatted.

- `terraform validate` checks that all resources, variables and modules are wired correctly.

You can also rely on the **GitHub Actions** workflow (`terraform.yml`) to run these checks automatically on every push and pull request.

##

###
### 6. Plan (safe demo mode)

``` bash
terraform plan
```
You’ll see:

 - `null_resource` creations for network vendors (**safe no-ops**).

 - Cloud resources planned **only if** you’ve provided valid credentials for AWS/Azure/GCP/OCI.

If you haven’t set any real credentials, Terraform will show what would be created, but all 

cloud provider calls will fail before apply — so nothing in your real accounts is changed.

##

###
### 7. (Optional, advanced) Apply to real environments

 >⚠️ **Warning – real changes ahead**
 > Only run `terraform apply` once you:
 > - **"Have set valid cloud credentials (AWS, Azure, GCP, OCI)."**
 > - **"Have updated terraform.tfvars with real CIDRs, regions, and resource names."**
 > - **"Are comfortable with the terraform plan output."**

``` bash
terraform apply
```
For portfolio/demo use, you usually **don’t need** to run `apply`.

`terraform validate` + `terraform plan` is enough to show recruiters and engineers that the configuration is correct.

##

###
### 🤖 GitHub Actions Workflows

This repo includes several CI workflows under `.github/workflows/`:

 - **Terraform Validation** – `terraform.yml`

      - Runs `terraform fmt -check`, `terraform init`, and `terraform validate` on pushes and PRs to `main`.

 - **Terraform Docs** – `terraform-docs.yml`

      - Uses `terraform-docs` to generate or update module documentation.

 - **TFLint** – `tflint.yml`

      - Runs `tflint --init` and `tflint`.

      - Uses `continue-on-error: true` so findings **do not fail** the build (soft-fail for demo use).

 - **Checkov Security Scan** – `checkov.yml`

      - Scans Terraform code for common misconfigurations.

      - Uses `soft_fail: true` so security findings are reported but **do not break** the build.

 - **Auto-format** – `terraform-fmt-autocommit.yml`

     - Optional workflow that can run `terraform fmt` on PRs and commit formatting fixes automatically.

 - **Infracost (presentation mode)** – `infracost.yml`

     - Stub workflow that only runs real cost estimation if `INFRACOST_API_KEY` is configured as a repo secret.

     - Otherwise it just prints guidance text and **never fails**.

These workflows show how you’d build a **real-world IaC pipeline** while still being safe to run in a public portfolio repo.

##

###
### 🧹 Cleaning Up

If you ever run `terraform apply` against a real account and want to tear everything down:
``` bash
terraform destroy
```
This will send delete calls for all resources that are currently tracked in `terraform.tfstate`.

##

###
### 🙋‍♀️ Notes & Limitations

- Vendor modules (Palo Alto, Fortinet, F5, Infoblox, Zscaler, Check Point, Cisco IOS/ACI/SD-Access, Juniper) are implemented with `null_resource` for **demo mode**.
In a real deployment you would replace those with:

 - Direct Terraform provider resources, or

 - `local-exec` / external scripts that call the vendor APIs.

- OCI configuration uses **fake OCIDs** by default. Replace them only if you have a real tenancy and want to test.

##

###
### 🤝 Contributing / Forking

This repo is intentionally structured to be easy to **fork** and adapt:

 - Add more cloud providers or regions.

 - Swap out `null_resource` stubs for real vendor provider resources.

 - Extend the CI pipeline (policy-as-code, SAST, SBOM, etc.).

If you fork it for your own portfolio, feel free to keep the structure and adapt the modules to your own lab environments.
