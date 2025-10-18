pipeline {
  agent any

  parameters {
    string(name: 'TARGET_IP', description: 'Target IP for Ansible')
  }

  stages {
    stage('Prepare Inventory Directory') {
      steps {
        script {
          def inventoryDir = "${env.WORKSPACE}/ansible"
          def inventoryFile = "${inventoryDir}/inventory.ini"

          // Create directory if not exists
          sh "mkdir -p ${inventoryDir}"

          // If inventory file does not exist, create with group header
          if (!fileExists(inventoryFile)) {
            writeFile file: inventoryFile, text: "[myhosts]\n"
          }

          // Append the TARGET_IP to the inventory file
          sh "echo '${params.TARGET_IP}' >> ${inventoryFile}"

          // Print inventory content
          sh "cat ${inventoryFile}"
        }
      }
    }

    stage('Run Ansible') {
      steps {
        sh "ansible-playbook -i ${env.WORKSPACE}/ansible/inventory.ini /var/lib/jenkins/workspace/infra-setup/ansible/depends-playbook.yml"
      }
    }
  }
}
