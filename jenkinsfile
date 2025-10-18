pipeline {
  agent any

  parameters {
    string(name: 'TARGET_IP', defaultValue: '10.0.0.10', description: 'Target IP for Ansible')
  }

  stages {
    stage('Prepare Inventory Directory') {
      steps {
        script {
          // Create directory if it doesn't exist
          sh "cd /home/ubuntu/ansible"

          def inventoryFile = "inventory.ini"

          // If file doesn't exist, create with group header
          if (!fileExists(inventoryFile)) {
            writeFile file: inventoryFile, text: "[myhosts]\n"
          }

          // Append new IP to inventory file
          sh "echo '${params.TARGET_IP}' >> ${inventoryFile}"

          // Print out inventory for debug
          sh "cat ${inventoryFile}"
        }
      }
    }

    stage('Run Ansible') {
      steps {
        // Use the inventory file from the passed directory
        sh "ansible-playbook -i inventory.ini ansible/depends-playbook.yml"
      }
    }
  }
}
