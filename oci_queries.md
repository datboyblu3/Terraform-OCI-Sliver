# OCI Queries

#### Enumerate all the private IPs of compartments within a given tenancy

1) List all compartments within your tenancy:
```go
oci iam compartment list --compartment-id-in-subtree true --all
```

2) List all VCNs in a compartment:
```go
oci network vcn list --compartment-id <COMPARTMENT_ID> --all
```

3) List all subnets in a VCN:
```go
oci network subnet list --compartment-id <COMPARTMENT_ID> --vcn-id <VCN_ID> --all
```

4) List all private IPs associated with resources:
```go
oci compute instance list --compartment-id <COMPARTMENT_ID> --all
```

From the instance list, retrieve the instance ID and use it to list the associated private IPs:
```go
oci compute instance list-vnics --instance-id <INSTANCE_ID>
```

## Script format
```go
#!/bin/bash

# Get all compartments
COMPARTMENTS=$(oci iam compartment list --compartment-id-in-subtree true --all --query "data[].[id]" --output text)

for COMPARTMENT_ID in $COMPARTMENTS; do
    echo "Compartment: $COMPARTMENT_ID"
    
    # Get all VCNs in the compartment
    VCNS=$(oci network vcn list --compartment-id $COMPARTMENT_ID --all --query "data[].[id]" --output text)

    for VCN_ID in $VCNS; do
        echo "  VCN: $VCN_ID"
        
        # Get all subnets in the VCN
        SUBNETS=$(oci network subnet list --compartment-id $COMPARTMENT_ID --vcn-id $VCN_ID --all --query "data[].[id]" --output text)

        for SUBNET_ID in $SUBNETS; do
            echo "    Subnet: $SUBNET_ID"
            
            # Get all instances in the compartment (across VCNs)
            INSTANCES=$(oci compute instance list --compartment-id $COMPARTMENT_ID --all --query "data[].[id]" --output text)

            for INSTANCE_ID in $INSTANCES; do
                # List private IPs for the instance
                VNICS=$(oci compute instance list-vnics --instance-id $INSTANCE_ID --query "data[].[privateIp]" --output text)
                
                for IP in $VNICS; do
                    echo "      Private IP: $IP"
                done
            done
        done
    done
done
```

## Search for Terraform files


**Searches in object storage**
```go
oci os object list --bucket-name <bucket_name> --query "data[?\"name\"=='*.tf' || \"name\"=='*.tfvars'].[\"name\"]" --all
```

**Search for Files by Metadata or Tags (If Tagged as Sensitive)**
```go
oci os object list --bucket-name <bucket_name> --tag "Sensitive=true" --all
```

**File Storage Query**
```go
oci fs file-system list --compartment-id <compartment_ocid> --query "data[?\"display-name\"=='*'].\"display-name\""
```

**Search for files in compute instances**
```go
oci compute instance list --compartment-id <compartment_ocid> --query "data[?\"display-name\"=='*'].\"display-name\""
```

**Searches for secretes in OCI vault**
```go
oci secrets secret list --compartment-id <compartment_ocid> --query "data[?\"secret-name\"=='*'].\"secret-name\""
```

**Search for IAM Policies That Might Allow Access to Sensitive Resources**
```go
oci iam policy list --compartment-id <compartment_ocid> --query "data[?\"statements\"=='*'].\"policy-name\""
```

**Search for Files in Oracle Cloud Infrastructure Registry**
```go
oci artifact container list --compartment-id <compartment_ocid> --query "data[?\"name\"=='*'].\"name\""
```