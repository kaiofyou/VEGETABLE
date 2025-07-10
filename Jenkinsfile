pipeline {
 agent any
 
 stages {
	stage('clone'){
		steps {
			echo 'Cloning source code'
			git branch:'main', url: 'https://github.com/kaiofyou/VEGETABLE.git'
		}
	} // end clones

  } // end stages
}//end pipeline

stage('Build Docker Image') {
    steps {
        sh 'docker build -t vegefoods .'
    }
}

stage('Run Container') {
    steps {
        sh 'docker run -d -p 8080:80 vegefoods'
    }
}
