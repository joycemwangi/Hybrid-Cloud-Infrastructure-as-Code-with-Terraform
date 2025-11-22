# Terraform IaC Hybrid Deployments

Automated Terraform IaC framework for **hybrid cloud** and **multi-vendor network automation**.  
Supports AWS, Azure, GCP, OCI (demo), and network/security platforms such as **Cisco ACI/IOS/SD-Access & Panorama**, **Palo Alto**, **Fortinet**, **Juniper**, **F5**, **Infoblox**, **Zscaler**, and **Check Point**.

This repo is designed as a **portfolio / reference implementation** to show how you structure multi-cloud, multi-vendor automation safely.

---

## 🔧 Features

- **Hybrid-cloud IaC**
  - AWS VPC + subnet
  - Azure resource group
  - GCP VPC network + subnet
  - OCI VCN + subnet (using *demo* OCIDs by default)

- **Network & Security Vendors**
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
  - Vendor modules use `null_resource` with `triggers` – you can see planned changes without touching real devices.
  - OCI uses dummy OCIDs by default so it never hits a real tenancy.

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
## ✅ Prerequisites

- **Terraform** ≥ 1.3
- Git
- (Optional) Cloud CLIs and credentials if you actually want to deploy:
  - AWS credentials (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, etc.)
  - Azure credentials (Service Principal or `az login`)
  - GCP Application Default Credentials
  - OCI config + API keys
- Access to any vendor platforms you want to target (Palo Alto, Fortinet, F5, etc.)

> 💡 You can run everything in **safe demo mode** WITHOUT real credentials.  
> Terraform will validate and plan successfully, but will not apply changes to real cloud accounts.

---

## 🚀 Getting Started

2. **Create your local variable file**

   Copy the example file and edit it locally:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   then edit `terraform.tfvars` with your own (or demo) values

3. **Initialize Terraform**
  ```bash
  terraform init
  ``` 
4. **Format & validate**

  terraform fmt
  terraform validate

5. **Plan**

   terraform plan

   You’ll see:
   null_resource creations for network vendors (safe no-ops)
   Cloud resources planned only if you’ve provided valid credentials.

6. **Apply (optional, only with real test accounts!)**

   terraform apply

7. **Destroy resources (Optional)**

   terraform destroy

   
**🔐 CI / Security & Quality Gates**

  This repo includes a production-style IaC validation pipeline:

 **Terraform Validation** – syntax & structure checks

 **TFLint (soft-fail)** – Terraform best practices

 **Checkov (soft-fail)** – IaC security scanning

 **terraform-docs** – auto-generate module documentation

 **Auto-format** – optional terraform fmt auto-commit

 **Infracost (presentation mode)** – cost estimation (runs only if API key exists)

**🔭 Roadmap**
 Add full environment workspaces (dev → test → prod)
 Add more vendor automation examples (Ansible, SDKs)
 Add Terraform matrix builds
 Add PCI DSS / CIS policies in Checkov

**📎 Notes**
 Never commit secrets. Use GitHub Secrets or your own .tfvars file. 
 OCI, Infoblox, and other sample values in the repo are fake / safe for public use.
 Designed to be readable by hiring managers + engineers reviewing your IaC & automation skills.
