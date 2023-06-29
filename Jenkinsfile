def BRANCH_NAME = 'main'
def prepareStages(String name) {
	def tasks = [:]
	tasks["task_1"] = {
	  stage ("task_1"){    
		node("${name}") {
			dir("${env.custom_var}"){
					sh 'echo -----------------1'
					sh './profile_run.sh profile_max "UC01 UC02" profile'					
			}
		}
	  }
	}

return tasks
}


def runStages(String name, String profile) {
	def tasks = [:]
	tasks["task_1"] = {
	  stage ("task_1"){    
		node("${name}") {
			dir("${env.custom_var}"){				
					sh "./profile_run.sh ${profile} P_SCRIPTS01.toString() profile"						
			}
		}
	  }
	}
	
return tasks
}



pipeline {
  parameters { // {
    choice(
      name: 'P_PROFILE',
      description: '',
      choices: ['profile_max', 'profile_confirm'] as List
    )  
    choice(
      name: 'P_SLAVE1',
      description: '',
      choices: ['enable', 'NULL'] as List
    )
    choice(
      name: 'P_SLAVE2',
      description: '',
      choices: ['NULL', 'enable'] as List
    )
    choice(
      name: 'P_SCRIPTS01',
      description: '',
      choices: ['UC01 UC02', 'UC01', 'NULL'] as List
    )	
    choice(
      name: 'P_SCRIPTS02',
      description: '',
      choices: ['NULL', 'UC01 UC02', 'UC01'] as List
    )		
  } // }
  agent none
  options {
    skipDefaultCheckout()
    buildDiscarder(logRotator(
      numToKeepStr: '10' + (BRANCH_NAME == 'dev' ? '' : '0'),
      daysToKeepStr: '10' + (BRANCH_NAME == 'dev' ? '' : '0'),
    ))
  }
  stages {
    stage('Build On slave1') {
	when {
		beforeAgent true;
	    expression {
            return P_SLAVE1.toString()!='NULL';
        }        
    }
		agent {
            label 'slave1'
        }
		steps {
			script {
				scmInfo = checkout scm
				f = fileExists 'README.md'
				echo "f=${f}"
				sh 'chmod +x jmeter-start-test.sh'
				sh 'chmod +x profile_run.sh'
			}		
		}	
	}
	stage('Build On slave2') {
	when {
		beforeAgent true;
	    expression {
            return P_SLAVE2.toString()!='NULL';
        }        
    }
		agent {
            label 'slave2'
        }
		steps {
			script {
				scmInfo = checkout scm
				f = fileExists 'README.md'
				echo "f=${f}"
				sh 'chmod +x jmeter-start-test.sh'
				sh 'chmod +x profile_run.sh'				
			}		
		}	
	}
	
	
    stage('Tests') {
		parallel {
			stage('Test On slave1') {
				when {
					beforeAgent true;
					expression {
						return P_SLAVE1.toString()!='NULL';
					}        
				}
			    agent {
                   label 'slave1'
                }				
				steps {						
					script {
						echo "Current workspace is ${env.WORKSPACE}"
						def workspace = "${env.WORKSPACE}"
						echo "Current workspace is ${workspace}"
						echo "Current workspace "+workspace
						env.custom_var=workspace
						currtasks1 =  runStages("slave1", P_PROFILE.toString())
							stage('Testt') {
								parallel currtasks1
							}					
					}	
				}
			}
			
			
			
		}	
	}
  }
 
}
