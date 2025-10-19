pipeline {
  agent any

  parameters {
    string(name: 'TARGET_IP', description: 'Target IP for Ansible')
  }
  environment {
    ANSIBLE_HOST_KEY_CHECKING = 'False'
  }

  stages {
    stage('Prepare Inventory Directory') {
      steps {
         script {
            def inventoryDir = "${env.WORKSPACE}/ansible"
            def inventoryFile = "${inventoryDir}/inventory.ini"

            // Create directory if not exists
            sh "mkdir -p ${inventoryDir}"

            // Overwrite inventory file with group header and current TARGET_IP
            writeFile file: inventoryFile, text: "[myhosts]\n${params.TARGET_IP}\n"

            // Print inventory content
            sh "cat ${inventoryFile}"
        }
      }
    }

  stage('Run Ansible') {
  steps {
    sshagent(['ansiblesshkey']) {
      sh "ansible-playbook -i ${env.WORKSPACE}/ansible/inventory.ini   --user=ubuntu ${env.WORKSPACE}/ansible/depends-playbook.yaml"
    }
  }
  }
  }
}
