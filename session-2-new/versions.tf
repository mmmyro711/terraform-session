terraform {
    required_version = "1.8.3"     // Terraform Version
    required_providers {     // Provider Version  
      aws = {
        source = "hashicorp/aws"
        version = "5.49.0"
      }
    }
}

// 1.8.3 = Symentic Versioning (Terraform Version)
    // 1 - Major (Upgrade) - Main Changes
    // 8 - Minor (Update) - Features/Enchancemets
    // 3 - Patch (Patching) - Fix Vulnerabilities 
