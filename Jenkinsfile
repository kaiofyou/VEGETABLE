// Jenkinsfile (Declarative Pipeline)

pipeline {
    // 1. Chỉ định môi trường thực thi
    // 'agent any' nghĩa là Jenkins có thể dùng bất kỳ agent nào có sẵn để chạy pipeline này.
    agent any

    // 2. Định nghĩa các biến môi trường
    // Giúp pipeline dễ đọc và dễ chỉnh sửa.
    environment {
        DOCKER_REGISTRY_URL = 'https://registry.hub.docker.com'
        DOCKER_HUB_USERNAME = 'duongtuan05' // Thay bằng username Docker Hub của bạn
        DOCKER_IMAGE_NAME   = "${DOCKER_HUB_USERNAME}/vegetable"
        // ID của thông tin đăng nhập đã lưu trong Jenkins
        DOCKER_HUB_CREDENTIALS_ID = '2972005'
    }

    // 3. Định nghĩa các giai đoạn của pipeline
    stages {
        // Giai đoạn 1: Lấy mã nguồn từ Git
        stage('✅ Checkout') {
            steps {
                echo 'Bắt đầu lấy mã nguồn...'
                // Thay bằng URL kho chứa Git của bạn
                git branch: 'main', url: 'https://github.com/kaiofyou/VEGETABLE.git'
            }
        }

        // Giai đoạn 2: Xây dựng Docker image
        stage('📦 Build Image') {
            steps {
                script {
                    echo "Đang build Docker image: ${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}"
                    // Sử dụng Dockerfile trong thư mục gốc để build image
                    // Gắn thẻ (tag) image với số build của Jenkins để dễ quản lý phiên bản
                    docker.build(DOCKER_IMAGE_NAME, "--tag ${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER} .")
                }
            }
        }

        

        // Giai đoạn 4: Đẩy image lên Docker Hub
        stage('🚢 Deploy to Registry') {
            steps {
                script {
                    echo "Đang đẩy image ${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER} lên Docker Hub..."
                    // Đăng nhập vào Docker Hub sử dụng credentials đã lưu và đẩy image
                    docker.withRegistry(DOCKER_REGISTRY_URL, DOCKER_HUB_CREDENTIALS_ID) {
                        docker.image("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}").push()

                        // (Tùy chọn) Đẩy thẻ "latest" để luôn có phiên bản mới nhất
                        docker.image("${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}").push('latest')
                    }
                }
            }
        }
    }

    // 4. Các hành động sau khi pipeline kết thúc
    post {
        always {
            echo 'Pipeline đã kết thúc.'
            // Dọn dẹp workspace để tiết kiệm dung lượng
            cleanWs()
        }
        success {
            echo 'Build thành công! Yay! 🚀'
        }
        failure {
            echo 'Build thất bại. 😭'
            // (Tùy chọn) Gửi thông báo qua email hoặc Slack
        }
    }
}